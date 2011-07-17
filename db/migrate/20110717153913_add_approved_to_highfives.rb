class AddApprovedToHighfives < ActiveRecord::Migration
  def change
    add_column :highfives, :approved, :bool
  end
end
