require 'spec_helper'

describe InterestGroup do
  let(:valid_attrs) { { name: 'Tom Cruise Fans', creator: 'hello'} }
  # let(:blanks) { [nil, ''] }

  describe 'validations' do
    context 'when given valid attributes' do
      it 'is valid' do
        interest_group = InterestGroup.new(valid_attrs)
        expect(interest_group).to be_valid
      end

      it 'requires a name' do
        interest_group = InterestGroup.new(valid_attrs.merge(name: nil))
        interest_group.valid?
        expect(interest_group.errors[:name]).to include "can't be blank"
      end

      it 'requires a creator' do
        interest_group = InterestGroup.new(creator: nil)
        interest_group.valid?
        expect(interest_group.errors[:creator]).to include "can't be blank"
      end
    end
  end
end
