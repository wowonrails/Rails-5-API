class Todo < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :title, :created_by, presence: true
end
