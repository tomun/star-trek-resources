require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature "the crew_members interface" do
  before do
    @crew_member = CrewMember.create(name:"Picard", rank:"capt")
    @credit = ReplicatorCreditTransaction.create(description:"Monthly allowance", amount:100, crew_member:@crew_member)
    @debit = ReplicatorDebitTransaction.create(description:"Lost poker game", amount:10, crew_member:@crew_member)
  end

  feature "on the index page" do
    before(:each) do
      visit crew_members_path
    end

    scenario "should list the crew member names" do
      expect(page).to have_content(@crew_member.name)
    end
  end

  feature "on the crew member page" do
    before(:each) do
      visit crew_member_path(@crew_member)
    end

    scenario "should show the crew member's credit transaction" do
      expect(page).to have_content("Monthly allowance")
    end

    scenario "should show the crew member's debit transaction" do
      expect(page).to have_content("Lost poker game")
    end

    scenario "should show the crew member's balance" do
      expect(page).to have_content("balance: #{@credit.amount - @debit.amount}")
    end
  end

  after do
    @crew_member.destroy
  end

end