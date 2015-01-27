class Replication < ActiveRecord::Base #ResourceUsage why doesn't deriving work?
	#has_one :replicator_debit_transation
	belongs_to :crew_member # shold derive from ResourceUsage?
end
