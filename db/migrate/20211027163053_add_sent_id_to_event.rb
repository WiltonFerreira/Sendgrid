class AddSentIdToEvent < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :sent, null: false, foreign_key: true
  end
end
