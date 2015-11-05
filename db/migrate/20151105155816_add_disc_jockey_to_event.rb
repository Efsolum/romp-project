class AddDiscJockeyToEvent < ActiveRecord::Migration
  def change
    add_column :events, :disc_jockey, :string
  end
end
