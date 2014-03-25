require 'spec_helper'

describe Membership do
  let(:user){User.create(first_name: 'Bob', last_name: 'Bill', email: 'test@test.com', role: 'Launcher')}
  let(:interest_group){InterestGroup.create(name: 'Best group ever', creator: user)}
  let(:membership){Membership.new(user: user, interest_group: interest_group)}

  it 'should belong to a user' do
    expect(membership).to respond_to(:user)
  end

  it 'should belong to a interest group' do
    expect(membership).to respond_to(:interest_group)
  end

  it 'should validate the presence of a user' do
    membership.user = nil
    expect(membership).to_not be_valid
    expect(membership.errors[:user]).to include("can't be blank")
  end
  it 'should validate the presence of an interest group' do
    membership.interest_group = nil
    expect(membership).to_not be_valid
    expect(membership.errors[:interest_group]).to include("can't be blank")
  end
end
