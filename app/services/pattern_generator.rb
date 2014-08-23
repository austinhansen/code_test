class PatternGenerator
  def initialize(minor_x, major_x, minor_y, major_y)
    @minor_x = minor_x
    @major_x = major_x
    @minor_y = minor_y
    @major_y = major_y
    create_pattern
  end

  private
  def create_pattern
    @grid = []
    create_grid
    @grid.each {|x| puts x}
  end

  def create_grid
    i = 0
    while i < @major_y
      @minor_y.times do
        add_line_to_grid(i)
      end
      i += 1
    end
  end

  def add_line_to_grid(i)
    if i.odd?
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
    if i.even?
      character = "X"
    else
      character = "O"
    end
    @unit += (character * @minor_x)
  end
end

hello = PatternGenerator.new(3, 4, 2, 5)
