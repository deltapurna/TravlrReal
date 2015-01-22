class AddPictureToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :picture, :string
  end
end
