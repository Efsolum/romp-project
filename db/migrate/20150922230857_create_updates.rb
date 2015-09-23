class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :title
      t.text :summary

      t.timestamps null: false
    end
  end
end
