class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :chef, null: false
      t.belongs_to :cook
      t.string :date, null: false
      t.string :start_time, null: false
      t.string :end_time, null: false
      t.string :wage, null: false
      t.string :description
      t.boolean :open, default: true
      t.timestamps
    end
  end
end
