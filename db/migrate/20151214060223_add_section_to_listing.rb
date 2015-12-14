class AddSectionToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :section, :string

  end
end
