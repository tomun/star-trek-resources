require "rails_helper"

RSpec.describe Replication, :type => :model do 

	it "belongs to a CrewMember" do
		crew_member = CrewMember.create name:"Picard", rank:"Capt"

		replication = Replication.create description:"Earl Grey", crew_member: crew_member

		expect(replication.crew_member).to eq(crew_member)
	end

end