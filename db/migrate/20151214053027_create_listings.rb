class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name 
    	t.string :size
    	t.string :description
    	t.integer :price
    	t.string :features
    	t.string :product_includes
    	t.string :product_recommendations
    	t.string :nicotine_level
    	t.string :dimensions
    	t.string :warning_section
    	t.string :youtube_video_link
    	t.string :gauges
    	t.string :ohm_level
    	t.string :coil_specs
    	t.string :note
    	t.string :safety_notes
    	
    end
  end
end
