class Pattern < ActiveRecord::Base
  validates_presence_of :minor_x
  validates_presence_of :minor_y
  validates_presence_of :major_x
  validates_presence_of :major_y
end
