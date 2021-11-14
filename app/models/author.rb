class Author < ApplicationRecord
    def name
        "#{first_name} #{last_name}"
    end
    validates :first_name, presence: true, length: {minimum: 2}
    validates :last_name, presence: true, length: {minimum: 2}
    validates :homepage, presence: true, format: {with: /http[s]?:\/\//, message: "must start with 'http://' or 'https://'"}
end
