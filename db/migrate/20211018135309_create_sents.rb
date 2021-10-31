class CreateSents < ActiveRecord::Migration[6.1]
  def change
    create_table :sents do |t|
      t.string :account
      t.text :info
      t.boolean :active

      t.timestamps
    end
  end
end
