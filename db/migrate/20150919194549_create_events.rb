class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start
      t.datetime :finish
      t.text :location

      t.timestamps null: false
    end
  end
end
