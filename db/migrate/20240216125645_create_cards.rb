class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards, id: :uuid do |t|
      t.string :title
      t.references :board, type: :uuid
      t.timestamps
    end
  end
end
