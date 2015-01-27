class CreateReplications < ActiveRecord::Migration
  def change
    create_table :replications do |t|
      t.string :description
      t.string :device

      t.timestamps null: false
    end
  end
end
