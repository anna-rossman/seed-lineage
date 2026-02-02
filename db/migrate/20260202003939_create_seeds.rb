class CreateSeeds < ActiveRecord::Migration[8.1]
  def change
    create_table :seeds do |t|
      t.string :name, null: false

      # Add null: true to allow first-generation seeds without parents
      t.references :parent_one,
                   null: true,  # ← Add this
                   foreign_key: { to_table: :seeds }

      t.references :parent_two,
                   null: true,  # ← Add this
                   foreign_key: { to_table: :seeds }

      t.timestamps
    end
  end
end
