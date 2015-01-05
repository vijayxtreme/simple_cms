class CreateSections < ActiveRecord::Migration
 
 def change
 	create_table :sections do |t|
 		t.integer "page_id" #links section to page parent
 		t.string "name"
 		t.integer "position"
 		t.boolean "visible"
 		t.string "content_type"
 		t.text "content"
 		t.timestamps
 	end
 	add_index("sections", "page_id")
 end

end
