class AddCrewMemberRefToReplicatorCreditTransaction < ActiveRecord::Migration
  def change
    add_reference :replicator_credit_transactions, :crew_member, index: true
    add_foreign_key :replicator_credit_transactions, :crew_members
  end
end
