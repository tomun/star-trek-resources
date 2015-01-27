class AddCrewMemberRefToReplication < ActiveRecord::Migration
  def change
    add_reference :replications, :crew_member, index: true
    add_foreign_key :replications, :crew_members
  end
end
