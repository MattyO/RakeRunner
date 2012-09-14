class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.boolean :canAddUsers
      t.boolean :canUpdateUserPermission
      t.boolean :canUpload

      t.timestamps
      t.references :user
    end
  end
end
