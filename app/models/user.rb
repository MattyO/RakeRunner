class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :telephone
end
