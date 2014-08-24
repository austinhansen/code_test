class Pattern < ActiveRecord::Base
  validates_presence_of :minor_x
  validates_presence_of :minor_y
  validates_presence_of :major_x
  validates_presence_of :major_y
  before_save :create_grid

  private

  def create_grid
    @grid = []
    generate_lines
    self.grid = @grid.each {|x| puts x}
  end

  def generate_lines
    @row = 0
    while @row < major_y
      minor_y.times do
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
    while i < major_x
      add_unit(i)
      i += 1
    end
    @unit
  end

  def add_unit(i)
    if i.even? && @row.odd? && major_x.odd?
      character = "O"
    elsif i.odd? && @row.odd? && major_x.odd?
      character = "X"
    elsif i.even?
      character = "X"
    else
      character = "O"
    end
    @unit += (character * minor_x)
  end
end
