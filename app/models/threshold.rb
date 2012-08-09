class Threshold < ActiveRecord::Base
   validates_uniqueness_of :priority,:on =>:update
  validates_presence_of :priority,:on =>:update
end
