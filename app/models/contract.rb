class Contract < ActiveRecord::Base

  belongs_to :cast
  belongs_to :occupation
  belongs_to :movie
end
