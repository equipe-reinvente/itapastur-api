class AddEntrepriseToEnterprisePhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :enterprise_photos, :enterprise, null: false, foreign_key: true
  end
end
