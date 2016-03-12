class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :image
      t.integer   :c_id
      t.timestamps null: false
    end
  end
end
