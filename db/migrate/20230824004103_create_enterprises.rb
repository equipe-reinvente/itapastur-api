class CreateEnterprises < ActiveRecord::Migration[7.0]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.text :description
      t.string :cellphone
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
