class Discussion < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :body, dependent: :delete
end
