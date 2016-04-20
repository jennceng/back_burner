class AddDecisionToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :decision, :string, default: "Pending"
  end
end
