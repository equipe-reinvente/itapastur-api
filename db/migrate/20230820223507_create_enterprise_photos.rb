class CreateEnterprisePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :enterprise_photos do |t|
      t.string :first_photo_url
      t.string :second_photo_url
      t.string :third_photo_url

      t.timestamps
    end
  end
end
