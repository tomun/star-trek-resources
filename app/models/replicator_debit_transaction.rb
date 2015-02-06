class ReplicatorDebitTransaction < ActiveRecord::Base 
	belongs_to :replication
	belongs_to :crew_member
end
