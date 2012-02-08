class User < ActiveRecord::Base

    validates_length_of :username, :maximum => 15, :minimum => 3
    validates_format_of :username, :with => /\A(^[a-zA-Z0-9]+$)\z/i
    validates_presence_of :username
    validates_presence_of :password
    validates_uniqueness_of :username
    validates_uniqueness_of :mailname
    validates_confirmation_of :password
    has_many :evaluations
    has_many :goodbads
    has_many :contact

end
