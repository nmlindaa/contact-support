class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :role
      t.string :phone
      t.string :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
