require 'rails_helper'

describe ClassLookups do
  before do
    stub_const "Thingable", Class.new

    Thingable.class_eval{ extend ClassLookups }
  end

  it "gets a class with a symbol" do
    expect(Thingable.class_for(:collection)).to eq Collection
  end

  it "gets a class with a class" do
    expect(Thingable.class_for(Collection)).to eq Collection
  end

  it "gets a class with a string" do
    expect(Thingable.class_for("Collection")).to eq Collection
  end

  it "gets a class with a plural string" do
    expect(Thingable.class_for("Collections")).to eq Collection
  end

  it "finds a model by parameters" do
    user = create :user, :registered
    expect(Thingable.find_by_params({user_id: user.id})).to eq user
  end


  context "with allowed types defined" do
    before do
      stub_const "Thingable", Class.new

      Thingable.class_eval{ extend ClassLookups }
      Thingable.class_eval{ def self.allowed_types; [Collection]; end }
    end

    it "gets an allowed class" do
      expect(Thingable.class_for("Collection")).to eq Collection
    end

    it "does not get a disallowed class" do
      expect{ Thingable.class_for("User") }.to raise_error(
        RuntimeError, /User is not a Thingable/)
    end
  end
end
