class GridGenerator
  def initialize(minor_x, major_x, minor_y, major_y)
    @minor_x = minor_x
    @major_x = major_x
    @minor_y = minor_y
    @major_y = major_y
  end

  def generate
    @grid = []
    generate_lines
    @grid
  end

  private

  def generate_lines
    @row = 0
    while @row < @major_y
      @minor_y.times do
        add_line_to_grid
      end
      @row += 1
    end
  end

  def add_line_to_grid
    if @row.even?
      @grid << create_line
    else
      @grid << create_line.reverse
    end
  end

  def create_line
    i = 0
    @unit = ""
    while i < @major_x
      add_unit(i)
      i += 1
    end
    @unit
  end

  def add_unit(i)
    if i.even? && @row.odd? && @major_x.odd?
      character = "O"
    elsif i.odd? && @row.odd? && @major_x.odd?
      character = "X"
    elsif i.even?
      character = "X"
    else
      character = "O"
    end
    @unit += (character * @minor_x)
  end
end
