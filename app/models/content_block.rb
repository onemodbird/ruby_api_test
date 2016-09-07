class ContentBlock < ActiveRecord::Base
  KINDS = ["html", "file", "interaction"]
  INTERACTIONS = ["reflect_revise", "reflect_revise_cet",
    "upload_classroom_practice", "write_reflection"]

  belongs_to :resource
  belongs_to :uploaded_file

  validates :resource, :position, :kind, presence: true
  validates :kind, inclusion: { in: KINDS }
  validates :key, presence: true, if: -> { kind == "interaction" }

  before_validation :set_initial_position, on: :create
  before_validation :nil_title
  before_save :sanitize_html, if: -> { kind != "file" && content_changed? }
  before_destroy :reset_positions

  def set_initial_position
    self.position ||= resource.content_blocks.count + 1
  end

  def nil_title
    self.title = nil if self.title.blank?
  end

  def sanitize_html
    unless resource.flags.stringify_keys["trusted"]
      self.content = self.class.sanitize(self.content)
    end
  end

  def reset_positions
    resource.content_blocks.where("position > ?", position)
      .update_all("position = position - 1")
  end

  def self.sanitize_config
    @sanitize_config ||=
      begin
        config = Sanitize::Config::BASIC.dup
        config[:elements] += %w{h1 h2 h3 h4 h5 h6 table tbody td tfoot th thead}
        config[:remove_contents] = true
        config[:add_attributes] = {}
        config
      end
  end

  def self.sanitize(html)
    Sanitize.fragment(html, sanitize_config)
  end
end
