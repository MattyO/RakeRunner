class CreateCommandParameters < ActiveRecord::Migration
  def change
    create_table :command_parameters do |t|
      t.string :name
      t.string :type

      t.timestamps
      t.references :rake_task
    end
  end
end
