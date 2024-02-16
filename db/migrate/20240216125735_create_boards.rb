class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards, id: :uuid do |t|
      t.string :title
      t.references :organization, type: :uuid
      t.timestamps
    end
  end
end
