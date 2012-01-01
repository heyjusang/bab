class Menu < ActiveRecord::Base
has_many :goodbads
belongs_to :restaurant
end
