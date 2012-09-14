class CreateRakeTasks < ActiveRecord::Migration
  def change
    create_table :rake_tasks do |t|
      t.string :task
      t.boolean :active

      t.timestamps
      t.references :user, :rake_file
    end
  end
end
