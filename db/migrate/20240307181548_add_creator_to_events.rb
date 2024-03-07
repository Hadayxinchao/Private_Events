class AddCreatorToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :creator, null: true, foreign_key: { to_table: :users }
  end
end