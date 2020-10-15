class CreateSecrets < ActiveRecord::Migration[6.0]
  def change
    create_table :secrets do |t|
      t.string :title
      t.text :body
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
