class Restaurant < ActiveRecord::Base
    has_many :evaluations
    has_many :menus
end
