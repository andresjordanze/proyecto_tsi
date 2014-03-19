class Subproduct < ActiveRecord::Base
  belongs_to :product
  attr_accessible :code
end
