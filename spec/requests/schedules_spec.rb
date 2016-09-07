require "rails_helper"

describe Appo::Api::Schedules do
  let(:schedulable) { create :chat, :with_schedule }
  let(:schedulable_type) { schedulable.class.name.downcase }

  it "requires a type" do
    get "/v1/schedules/icalendar", id: schedulable.id
    expect_response_code_of 400
  end

  it "requires an id" do
    get "/v1/schedules/icalendar", type: schedulable_type
    expect_response_code_of 400
  end

  describe "with valid params" do
    before :each do
      get "/v1/schedules/icalendar", type: schedulable_type, id: schedulable.id
      expect_response_code_of 200
    end

    it "returns text/calendar content type" do
      expect(response.headers["Content-Type"]).to eq("text/calendar")
    end

    it "specifies download filename with .ics extention" do
      expect(response.headers["Content-Disposition"])
        .to eq(%(attachment; filename="#{schedulable.name.sub("#", "")}.ics"))
    end

    it "uses CRLF line endings" do
      expect(response.body).to eq(response.body.split("\r\n").join("\r\n"))
    end

    it "appears to be an iCalendar file" do
      expect(response.body).to match(/\ABEGIN:VCALENDAR.*END:VCALENDAR\z/m)
    end
  end
end
