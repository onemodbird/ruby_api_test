class ChangeLogSerializer < BaseSerializer
  attributes :id, :user_id, :change, :created_at_i
end
