module ApplicationGameHelper
  def cell_style(cell)
    if cell.open? && cell.value < 9
      style = "open"
    elsif cell.flagged?
      style = "flagged"
    elsif cell.open? && cell.value == 9
      style = "open mine"
    else
      style = "close"
    end
    style
  end
end
