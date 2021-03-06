class GridGenerator
  attr_accessor :grid

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

  def generate_lines
    row = 0
    @major_y.times do
      @minor_y.times do
        add_line_to_grid(row)
      end
      row += 1
    end
  end

  def add_line_to_grid(row)
    if row.even?
      @grid << create_line(row)
    else
      @grid << create_line(row).reverse
    end
  end

  def create_line(row)
    section = 0
    @unit = ""
    @major_x.times do
      add_unit(row, section)
      section += 1
    end
    @unit
  end

  def add_unit(row, section)
    if section.even? && row.odd? && @major_x.odd?
      character = "O"
    elsif section.odd? && row.odd? && @major_x.odd?
      character = "X"
    elsif section.even?
      character = "X"
    else
      character = "O"
    end
    @unit += (character * @minor_x)
  end
end
