require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { User.new(name: "Raj", card:"123456789123", address: "Greek Village", mobile:"9842861254", email:"uskibehen@gmail.com") }

  before { subject.save }

  it "name should be present"do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "card should be present"do
    subject.card = nil
    expect(subject).to_not be_valid
  end

  it "address should be present"do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it "mobile should be present"do
    subject.mobile = nil
    expect(subject).to_not be_valid
  end

  it "email should be present"do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  # it "validates uniqueness of email" do
  #   subject.create(:tag, email: 'yht@gmail.com', name: "GAND")
  #   should validate_uniqueness_of(:email)
  # end

end
