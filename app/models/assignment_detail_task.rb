class AssignmentDetailTask < ActiveRecord::Base
  KINDS = %w{begin progress complete}

  belongs_to :assignment_detail
  belongs_to :user
  belongs_to :resource
  validates :interaction, presence: true
  validates :kind, presence: true, inclusion: KINDS

  after_create :update_detail_state
  after_create :run_kind_callback

  def data=(new_data)
    # Extract any file values into UploadedFiles and replace with metadata
    self["data"] = new_data.inject({}) do |memo, pair|
      val = pair[1]
      if val.is_a?(Hash) && val["filename"]
        uploaded_file = UploadedFile.create!(file: val, user_id: user_id)
        val = UploadedFileSerializer.serialize(uploaded_file).merge(type: "file")
      end

      memo[pair[0]] = val
      memo
    end
  end

  def update_detail_state
    # Include updated_at since state may be same, but we want to update timestamp
    assignment_detail.update_attributes state: self.kind, updated_at: Time.now
  end

  def run_kind_callback
    callback = "after_#{kind}"
    if respond_to?(callback, true)
      send callback
    end
  end


  private

  def after_progress
    if assignment_detail.progress_complete?(self.interaction)
      assignment_detail.complete_interaction!(self.interaction)
    end
  end

end

