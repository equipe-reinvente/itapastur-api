class CreateCommennts < ActiveRecord::Migration[7.0]
  def change
    create_table :commennts do |t|
      t.text :text_content
      t.references :user, null: false, foreign_key: true
      t.references :enterprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
