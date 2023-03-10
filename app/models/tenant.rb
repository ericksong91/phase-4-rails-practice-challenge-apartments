class Tenant < ApplicationRecord
    validates :age, numericality: { greater_than_or_equal_to: 18}
    validates :age, presence: true
    validates :name, presence: true

    has_many :leases
    has_many :apartments, through: :leases
end
