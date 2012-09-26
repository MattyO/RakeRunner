class CreateRunHistories < ActiveRecord::Migration
  def change
    create_table :run_histories do |t|
      t.references :rake_task
      t.datetime :enqueued
      t.datetime :started
      t.datetime :finished
      t.string :filename
      t.string :status

      t.timestamps
    end
    add_index :run_histories, :rake_task_id
  end
end
