require "rails_helper"

RSpec.describe ResourceUpdateJob, type: :job do
  let(:app_resource) { create :resource, :ios_app }

  def job(fetch_return_value = :nope)
    job = ResourceUpdateJob.new

    if fetch_return_value != :nope
      allow(job).to receive(:fetch).and_return fetch_return_value
    end

    job
  end

  it "fails for non-updatable resource" do
    resource = create :resource, kind: "file"
    expect{ subject.fetch(resource) }.to raise_error(RuntimeError)
  end

  it "marks a resource defunct" do
    job(nil).perform(app_resource.id)
    expect(app_resource.reload.defunct_at).to_not be_nil
  end

  it "updates a resource" do
    updated = app_resource.attributes.merge(name: "Updated")

    job(updated).perform(app_resource.id)
    expect(app_resource.reload.name).to eq "Updated"
  end
end
