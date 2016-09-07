class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :resource

  validates :user, :presence => true
  validates :resource, :presence => true
  validates :comment, :presence => true

  before_save do
    self.expert = self.user.expert?
    true
  end

  %w[content_score= feature_score= engagement_score=].each do |setter|
    define_method setter do |score|
      super(score).tap do
        calculate_total_score
      end
    end
  end

  private

  def calculate_total_score
    self.total_score = content_score + feature_score + engagement_score
    calculate_percent_score
  end

  def calculate_percent_score
    self.percent_score = (total_score.to_f / 30 * 100).round
  end
end
