class CreateActivityAdvs < ActiveRecord::Migration
  def change
    create_table :activity_advs do |t|
      t.integer       :a_id, null: false
      t.integer       :a_type, null: false
      t.timestamps null: false
    end
  end
end
