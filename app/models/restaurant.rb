class Restaurant < ActiveRecord::Base
    has_many :evaluations
    has_many :menus


    has_attached_file :avatar, :default_url => 'bag.png'
end
