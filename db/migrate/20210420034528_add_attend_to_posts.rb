class AddAttendToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :attend, :text
  end
end
