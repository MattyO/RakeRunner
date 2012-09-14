class CreateRakeFiles < ActiveRecord::Migration
  def change
    create_table :rake_files do |t|
      t.boolean :active
      t.string :path
      t.string:file_name

      t.timestamps
      t.references :user
    end
  end
end
