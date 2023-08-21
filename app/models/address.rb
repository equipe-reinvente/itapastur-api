class Address < ApplicationRecord
    belongs_to :event, optional: true
    belongs_to :enterprise, optional: true
end
