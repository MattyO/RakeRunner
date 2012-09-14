class Permission < ActiveRecord::Base
  attr_accessible :canAddUsers, :canUpdateUserPermission, :canUpload
  belongs_to :user
end
