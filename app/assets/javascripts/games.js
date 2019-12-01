function init_click_event() {
  $(".click_cell").on("click", function (event) {
    var game_status = $('#game_status').val();

    if (game_status === 'game_over' || game_status === 'winner') {
      return false;
    }

    var id = $(this).attr('id');
    var flagged = $('#flagged').is(':checked');

    var data = JSON.stringify({
      flagged: flagged

    });
    $.ajax({
      type: "post",
      url: "cells/" + id + "/click",
      data: data,
      success: function (data) {
        update_board(data);
        check_game_status(data);
      }
      ,
      dataType: "json",
      contentType: 'application/json',
    });

  });
}

function check_game_status(data) {
  if (data.status === 'game_over') {
    var game_status = $('#game_status')
    game_status.val(data.status);
    alert('Game Over');
  }else if (data.status === 'winner') {
    var game_status = $('#game_status')
    game_status.val(data.status);
    alert('Congratulations, you win!!!');
  }
}

function clean_board() {
  $('#game_board').html('');
  $('#game_status').val('1')
}

function show_flag() {
  $('#input_flag').removeClass('hidden');
}

function draw_board(data) {
  var str;
  for (var i = 0; i < data.rows; i++) {
    str = '<tr>';
    $.each(data.cells, function (y) {
      if (this.row === i) {
        str += '<th id="' + this.id + '" class="click_cell close"></th>';
      }
    })
    $('#game_board').append(str + '</tr>');
  }
  init_click_event();
}

function update_board(data) {
  $.each(data.cells, function (y) {
    cell = $('#' + this.id);
    if (this.status === 'opened') {
      cell.addClass('open');
      cell.removeClass('close');
      if (this.value === 9) {
        cell.addClass('mine');
        cell.html('B');
      } else {
        cell.html(this.value);
      }
    } else if (this.status === 'flagged') {
      cell.addClass('flagged');
      cell.html('?');
    }


  })
}


$(document).ready(function () {
  $(".new_game").on("click", function (event) {
    var user_id = $('#user_id').val();
    var rows = $('#rows').val()
    var columns = $('#columns').val()
    var mines = $('#mines').val()

    var data = JSON.stringify({
      rows: rows,
      columns: columns,
      mines: mines,
      user_id: user_id
    });

    $.ajax({
      type: "post",
      url: "/game_boards",
      data: data,
      success: function (data) {
        show_flag();
        clean_board();
        draw_board(data);
      }
      ,
      dataType: "json",
      contentType: 'application/json',
    });
  });
});
