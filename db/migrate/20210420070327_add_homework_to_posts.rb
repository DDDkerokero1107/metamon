class AddHomeworkToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :homework, :text
  end
end
