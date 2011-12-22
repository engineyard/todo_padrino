class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.boolean :done
      t.integer :list_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :tasks
  end
end
