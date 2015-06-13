class AddExtraAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, default: ""
    add_column :users, :full_name, :string, default: ""
    add_column :users, :bio, :text, default: ""
  end
end
