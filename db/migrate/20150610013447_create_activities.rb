class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.datetime :time
      t.string :action
      t.string :description

      t.timestamps null: false
    end
  end
end
