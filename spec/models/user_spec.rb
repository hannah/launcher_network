require 'spec_helper'


describe User do
  let(:valid_attributes) { { first_name: 'Tom', last_name: 'Cruise', email: 'tom@cruise.com', role: "Launcher" } }
  let(:user){User.new(valid_attributes)}


  describe 'validations' do
    context 'when given valid attributes' do
      it 'is valid' do
        expect(user).to be_valid
      end

      it 'requires a first name' do
        user.first_name = nil
        expect(user).to_not be_valid
        expect(user.errors[:first_name]).to include "can't be blank"
      end

      it 'requires a last name' do
        user.last_name = nil
        expect(user).to_not be_valid
        expect(user.errors[:last_name]).to include "can't be blank"
      end

      it 'requires a valid email' do
        user.email = nil
        expect(user).to_not be_valid
        expect(user.errors[:email]).to include "can't be blank"

        user.email = '@gmail.com'
        expect(user).to_not be_valid
        expect(user.errors[:email]).to include "is invalid"

        user.email = 'hi@'
        expect(user).to_not be_valid
        expect(user.errors[:email]).to include "is invalid"
      end

      it 'requires an role' do
        user.role = nil
        expect(user).to_not be_valid
        expect(user.errors[:role]).to include "must be an Experience Engineer or Launcher"

        user.role = 'Cookie Monster'
        expect(user).to_not be_valid
        expect(user.errors[:role]).to include "must be an Experience Engineer or Launcher"
      end

      it 'should have many interest groups' do
        user.save!
        interestgroup = InterestGroup.create(name: 'Sesame Street', creator: user)
        user.interest_groups = [interestgroup]
        expect(user.interest_groups).to include(interestgroup)
      end

    end
  end
end
