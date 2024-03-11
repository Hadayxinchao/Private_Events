class AddPrivateToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :private, :boolean, default: false
  end
end
