class Author < ApplicationRecord
    validates :fullName, presence: true
end
