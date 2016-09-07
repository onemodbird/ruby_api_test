# ChangeLoggable module allows inclusion and definition of attributes to create
# a ChangeLog on model updates.
#
# Usage:
#   class MyClass
#     include ChangeLoggable
#     change_log_for :attribute_one, :attribute_two
#   end
#
# Note:
#   For more complex logging, you can define a custom change log handler
#   and use the #change_log method directly.
#
#   Example:
#     def change_log_for_attribute_two(changed_by, previous_value, new_value)
#       change_log(changed_by, "Attribute two value was changed to #{new_value}")
#     end
module ChangeLoggable
  extend ActiveSupport::Concern
  extend ClassLookups

  def self.allowed_types
    [Collection, AssignmentDetail]
  end

  included do
    attr_reader :change_log_for
    attr_accessor :changed_by
    has_many :change_logs, dependent: :destroy, as: :change_loggable
    after_commit :create_change_logs, on: :update,
      if: Proc.new { |loggable| loggable.changed_by.present? }
  end

  def create_change_logs
    (self.class.change_log_for & previous_changes.keys).each do |changed|
      if respond_to? "change_log_for_#{changed}", true
        send "change_log_for_#{changed}", changed_by, *previous_changes[changed]
      else
        change_log(changed_by, "#{changed} updated")
      end
    end
  end

  def change_log(user_id, change, associated_type = nil, associated_id = nil)
    change_logs.create(user_id: user_id, change: change,
      associated_type: associated_type, associated_id: associated_id)
  end

  class_methods do
    def change_log_for(*attrs)
      @change_log_for ||= []
      @change_log_for = (@change_log_for + attrs.map(&:to_s)).uniq
    end
  end
end
