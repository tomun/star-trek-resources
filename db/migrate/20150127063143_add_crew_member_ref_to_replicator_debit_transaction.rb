class AddCrewMemberRefToReplicatorDebitTransaction < ActiveRecord::Migration
  def change
    add_reference :replicator_debit_transactions, :crew_member, index: true
    add_foreign_key :replicator_debit_transactions, :crew_members
  end
end
