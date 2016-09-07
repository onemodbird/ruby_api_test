class ChangeLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :change_loggable, polymorphic: true
  belongs_to :associated, polymorphic: true
end
