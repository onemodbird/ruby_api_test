module Demo
  class VifDemoUser
    DATA_FILE = Rails.root.join("db", "vif-demo.json")

    def self.data
      @data ||= JSON.parse(File.read(DATA_FILE))
    end

    def self.intercept?(user)
      user.flags["vif_demo_user"] == true
    end

    def self.metrics(id)
      data["organization"]
    end

    def self.learner(id)
      data["learners"].detect { |learner| learner["id"] == id }
    end

    def self.organization_user
      org = data["organization"].slice("id", "district_id", "state_id", "name", "type")
      { "id" => SecureRandom.uuid, "role" => "admin", "organization" => org }
    end
  end
end
