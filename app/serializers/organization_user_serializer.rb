class OrganizationUserSerializer < BaseSerializer
  attributes :id, :user_id, :role
  has_one :organization
end
