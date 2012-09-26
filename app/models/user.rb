class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :telephone

  def self.sessionSymbol
    :current_user_id
  end

end
