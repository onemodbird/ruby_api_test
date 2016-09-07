module Assignable
  extend ActiveSupport::Concern
  extend ClassLookups

  def self.allowed_types
    [Collection]
  end

  def assignable_type
    self.class.name
  end

  included do
    has_many :assignments, as: :assignable
  end
end
