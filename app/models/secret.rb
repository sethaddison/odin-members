class Secret < ApplicationRecord
  belongs_to :member
  validates :title, :body, presence: true
end
