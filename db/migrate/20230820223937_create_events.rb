class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :time
      t.string :description
      t.string :photo_url
      t.references :address, null: false, foreign_key: true
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
