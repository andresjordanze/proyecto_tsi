class Subproduct < ActiveRecord::Base
  belongs_to :product
    belongs_to :sale
  attr_accessible :code, :sale_id
end
