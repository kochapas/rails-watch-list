class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { case_sensitive: false, scope: :list, message: 'The movie existed in this list!' }
end
