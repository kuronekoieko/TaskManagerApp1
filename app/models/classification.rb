class Classification < ApplicationRecord
  validates :name, { presence: true, uniqueness: true }
end
