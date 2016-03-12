class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :shopping_p, :integer, null: false, default: 0
    add_column :users, :adventure_p, :integer, null: false, default: 0
    add_column :users, :sightseing_p, :integer, null: false, default: 0
    add_column :users, :nightlife_p, :integer, null: false, default: 0
    add_column :users, :winter_p, :integer, null: false, default: 0
    add_column :users, :beach_p, :integer, null: false, default: 0
    add_column :users, :history_p, :integer, null: false, default: 0
    add_column :users, :architecture_p, :integer, null: false, default: 0
  end
end
