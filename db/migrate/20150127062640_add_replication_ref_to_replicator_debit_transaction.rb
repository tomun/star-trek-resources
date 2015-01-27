class AddReplicationRefToReplicatorDebitTransaction < ActiveRecord::Migration
  def change
    add_reference :replicator_debit_transactions, :replication, index: true
    add_foreign_key :replicator_debit_transactions, :replications
  end
end
