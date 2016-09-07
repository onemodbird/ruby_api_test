module InitializeUUID
  extend ActiveSupport::Concern

  included do
    validates :id, presence: true
    after_initialize -> { self.id = SecureRandom.uuid if id.nil? }
  end
end
