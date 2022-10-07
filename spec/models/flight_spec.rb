require 'rails_helper'

RSpec.describe Flight, type: :model do
  # pending "add some examples to (or delete) #{FILE}"
  subject { Flight.new(category:"jumbo", manufacturer:"AirBus", source:"BLR", destination:"LAX", capacity:30, status: "available", cost: 300) }

  before { subject.save }

  it "category should be present"do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it "manufacturer should be present"do
    subject.manufacturer = nil
    expect(subject).to_not be_valid
  end

  it "source should be present"do
    subject.source = nil
    expect(subject).to_not be_valid
  end

  it "destination should be present"do
    subject.destination = nil
    expect(subject).to_not be_valid
  end

  it "capacity should be present"do
    subject.capacity = nil
    expect(subject).to_not be_valid
  end

  it "status should be present"do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it "cost should be present"do
    subject.cost = nil
    expect(subject).to_not be_valid
  end


end