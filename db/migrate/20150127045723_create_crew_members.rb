class CreateCrewMembers < ActiveRecord::Migration
  def change
    create_table :crew_members do |t|
      t.string :name
      t.string :rank

      t.timestamps null: false
    end
  end
end
