class Pattern < ActiveRecord::Base
  validates_presence_of :minor_x
  validates_presence_of :minor_y
  validates_presence_of :major_x
  validates_presence_of :major_y
  before_save :create_grid

  private

  def create_grid
    @grid = ""
    generate_lines
    self.grid = @grid.chop
  end

  def generate_lines
    i = 0
    while i < major_y
      minor_y.times do
        add_line_to_grid(i)
      end
      i += 1
    end
  end

  def add_line_to_grid(i)
    if i.odd?
      @grid << create_line + "\n"
    else
      @grid << create_line.reverse + "\n"
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
    if i.even?
      character = "X"
    else
      character = "O"
    end
    @unit += (character * minor_x)
  end
end
