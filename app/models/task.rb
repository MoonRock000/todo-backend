class Task < ApplicationRecord
  belongs_to :user

  enum status: { pending: 0, complete: 1 }

  validates :description, presence: true, length: { minimum: 4, maximum: 100 }
end
