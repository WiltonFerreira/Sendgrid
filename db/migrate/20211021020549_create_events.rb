class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :account, null: false, foreign_key: true
      t.integer :timestamp
      t.text :event
      t.text :email
      t.text :smtp_id
      t.text :sg_event_id
      t.text :sg_message_id
      t.text :category
      t.text :newsletter
      t.text :response
      t.text :reason
      t.string :ip
      t.text :useragent
      t.text :attempt
      t.text :status
      t.text :type_id
      t.text :url
      t.text :additional_arguments
      t.integer :event_post_timestamp
      t.text :raw
      t.integer :asm_group_id

      t.timestamps
    end
  end
end
