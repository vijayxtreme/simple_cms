class CreateAdminUsersPageJoin < ActiveRecord::Migration
  def change
    create_table :admin_users_pages, :id => false do |t|
    	t.integer "admin_user_id"
    	t.integer "page_id"
    end
    add_index :admin_users_pages, ["admin_user_id", "page_id"]

  end
end

#id equals false gets rid of rails making a id column on the join table, we don't need that