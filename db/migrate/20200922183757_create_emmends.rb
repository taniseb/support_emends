class CreateEmmends < ActiveRecord::Migration[6.0]
  def change
    create_table :emmends do |t|
      t.references :user, null: false, foreign_key: true
      t.string :project
      t.string :thema

      t.timestamps
    end
  end
end
