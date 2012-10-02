require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  attr_accessible :email, :name, :password, :telephone

  def password=(text)
    @password = Password.create(text) 
  end

  def password
    @password ||= Password.new(read_attribute(:password))
  end

  def self.sessionSymbol
    :current_user_id
  end

end
