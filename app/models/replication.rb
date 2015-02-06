class Replication < ActiveRecord::Base 
	has_one :replicator_debit_transaction
	belongs_to :crew_member 
end
