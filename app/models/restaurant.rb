class Restaurant < ActiveRecord::Base
    has_many :evaluations
    has_many :menus


    has_attached_file :avatar, :default_url => 'bag.png', :path => '/home/co9901/s301/public/system/:attachment/:id/:style/:filename', :url => 'http://co9901.cafe24.com:9901/system/avatars/1/original/:filename'
end
