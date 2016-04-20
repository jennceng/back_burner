class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.belongs_to :post, null: false
      t.belongs_to :cook, null: false 
    end
  end
end
