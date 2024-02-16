class Organization < ApplicationRecord
  has_many :boards
  has_many :organization_users, class_name: 'OrganizationUser'
  has_many :users, through: :organization_users, source: :user, class_name: 'User'

  validates_presence_of :title
end
