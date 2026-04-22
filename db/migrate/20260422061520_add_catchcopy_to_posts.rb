class AddCatchcopyToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :catchcopy, :string
  end
end
