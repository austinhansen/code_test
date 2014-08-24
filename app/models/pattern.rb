require 'grid_generator'

class Pattern < ActiveRecord::Base
  validates_presence_of :minor_x
  validates_presence_of :minor_y
  validates_presence_of :major_x
  validates_presence_of :major_y
  before_save :create_grid

  private

  def create_grid
    generator = GridGenerator.new(self.minor_x, self.major_x, self.minor_y, self.major_y)
    self.grid = generator.generate
  end
end
