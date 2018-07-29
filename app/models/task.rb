class Task < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  enum status: %i(pending finished canceled)
end

