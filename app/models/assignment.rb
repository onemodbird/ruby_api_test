class Assignment < ActiveRecord::Base
  validates_presence_of :assignable_id, :assignable_type, :user, presence: true

  belongs_to :user
  belongs_to :assignable, polymorphic: true
  has_many :assignment_details

  scope :with_includes, -> { includes(:assignment_details).includes(assignable: { resources: [:badges] }) }

  def self.assign_all(emails, cet_type)
    User.where(email: emails).each do |user|
      cet_flag = cet_type == "all" ? nil : cet_type == "cet"

      puts "Adding #{cet_type} assignments to user " +
        "#{user.id} - #{user.name} - #{user.email}"

      collections = Collection.where(visibility: "protected")
      collections = collections.flagged("cet", cet_flag) if cet_flag.present?

      collections.each do |collection|
        find_or_create_by!(user_id: user.id, assignable: collection)
      end
    end
  end

  def self.all_interactions
    @all_interactions = nil if Rails.env.development?
    @all_interactions ||= YAML.load_file(File.join(Rails.root, "app/domain/data/assignments.yml"))["interactions"]
  end

  def self.assign(email, collection_names, cet)
    user = User.find_by(email: email)
    cet_filter = cet ? :flagged : :not_flagged

    if !user
      puts "User not found by email: #{email}"
      return
    end

    Array(collection_names).map do |name|
      collections =
        Collection
          .where(name: name, visibility: "protected")
          .send(cet_filter, "cet")
          .load

      if collections.size < 1
        puts "No collection found for name: #{name}, cet: #{cet}"
        return
      elsif collections.size > 1
        puts "Multiple collections found for name: #{name}, cet: #{cet}"
        return
      end

      collection = collections.first

      puts "Assigning #{user.email} to #{collection.name} (#{collection.id})"
      find_or_create_by!(user_id: user.id, assignable: collection)
    end
  end

  def detail_for_resource(resource_or_id)
    resource_id = resource_or_id.is_a?(Resource) ?
      resource_or_id.id : resource_or_id

    AssignmentDetail.find_or_create_by(
      user_id: self.user_id,
      assignment_id: self.id,
      resource_id: resource_id
    )
  end
end
