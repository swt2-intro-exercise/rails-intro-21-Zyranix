class Paper < ApplicationRecord
    has_and_belongs_to_many :authors
    validates :title, presence: true, length: {minimum: 3}
    validates :venue, presence: true, length: {minimum: 3}
    validates :year, presence: true, numericality: { only_integer: true }
end
