class CreateOrganizationUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :organization_users, id: :uuid do |t|
      t.references :user, type: :uuid
      t.references :organization, type: :uuid
      t.timestamps
    end
  end
end
