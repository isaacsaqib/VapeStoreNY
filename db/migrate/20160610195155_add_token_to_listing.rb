class AddTokenToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :token, :string
  end
end
