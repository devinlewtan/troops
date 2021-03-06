class CreateUserIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ingredients do |t|
      t.integer :qty
      t.string :food
      t.references :user, foreign_key: true

      t.timestamps
    end
	add_index :user_ingredients, [:user_id, :created_at]
  end
end

