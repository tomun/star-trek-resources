class ReplicatorDebitTransaction < ActiveRecord::Base #DebitTransaction
	belongs_to :replication
	belongs_to :crew_member # should come from derived?
end
