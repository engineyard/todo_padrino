class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :lists
  end
end
