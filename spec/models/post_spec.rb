require 'spec_helper'

describe Post do
  let(:user){User.create(first_name: 'Bill', last_name: 'Bob', email: 'test@test.com', role: "Launcher")}
  let(:post){Post.new(body: 'hello', user: user)}

  it 'should belong to a user' do
    # Test that post has a method called user
    expect(post).to respond_to(:user)
    # Save the post and expect the post's user to be the user tha we associated with it
    post.save!
    expect(post.user).to eql(user)
  end

  it 'requires a user' do
    # set the post to not have a user
    post.user = nil
    expect(post).to_not be_valid
    expect(post.errors[:user]).to include("can't be blank")
  end

  it 'requires a body' do
    # set the post's body to be nil
    post.body = nil
    expect(post).to_not be_valid
    expect(post.errors[:body]).to include("can't be blank")
  end

  it 'does not allow a body to be more than 500 characters' do
    # set the post's body to be over 500 characters
    post.body = 'a' * 501
    expect(post).to_not be_valid
    expect(post.errors[:body]).to include("is too long (maximum is 500 characters)")
  end

end
