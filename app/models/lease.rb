class Lease < ApplicationRecord
    validates :rent, presence: true
    validates :rent, numericality: { only_integer: true }
    validates :apartment_id, presence: true
    validates :tenant_id, presence: true

    belongs_to :apartment
    belongs_to :tenant
end
