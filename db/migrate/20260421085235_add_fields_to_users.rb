class AddFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :profile, :text
    add_column :users, :affiliation, :string
    add_column :users, :position, :string
  end
end
