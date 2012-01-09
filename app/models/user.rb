class User < ActiveRecord::Base

    validates_length_of :username, :maximum => 15
    validates_length_of :password, :maximum => 15
    validates_format_of :username, :with => /\A(^[a-zA-Z0-9]+$)\z/i
    validates_format_of :password, :with => /\A(^[a-zA-Z0-9]+$)\z/i
    validates_presence_of :username
    validates_presence_of :password
    validates_uniqueness_of :username
    validates_confirmation_of :password
    validates_presence_of :password_confirmation

end
