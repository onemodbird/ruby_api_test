class LearningRegistrySubmission < ActiveRecord::Base
  belongs_to :resource

  scope :pending, -> { where(reviewed_at: nil).order(:created_at) }

  def approve
    set_oer(true)
  end

  def reject
    set_oer(false)
  end

  private

  def set_oer(status)
    transaction do
      resource.update_attributes(oer: status)
      update_attributes(reviewed_at: Time.now, approved: status)
    end
  end
end
