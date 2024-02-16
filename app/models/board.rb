class Board < ApplicationRecord
  belongs_to :organization

  validates_presence_of :title
end
