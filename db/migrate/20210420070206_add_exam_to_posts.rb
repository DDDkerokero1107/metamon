class AddExamToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :exam, :text
  end
end
