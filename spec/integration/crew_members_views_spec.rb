require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "the crew_members interface" do
  before(:all) do
    @crew_members = [ CrewMember.new(name:"Picard", rank:"capt") ]
   end

  describe "on the index page" do
    before(:each) do
      visit crew_members_path
    end

    it "should list the crew member names" do
      @crew_members.each do |crew_member|
        page.should have_content(crew_member.name)
      end
    end

  end
end