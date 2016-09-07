class AssignmentDetail < ActiveRecord::Base
  METADATA_FIELDS = ["sectionsCompleted"]

  belongs_to :assignment
  belongs_to :resource
  belongs_to :user
  has_many :badge_requirements, through: :resource
  has_many :assignment_detail_tasks

  def add_task(user, interaction, kind, data)
    raise "Interaction '#{interaction}' is already complete" if interaction_complete?(interaction)

    data.deep_stringify_keys!
    provided_inputs = data.keys.map(&:to_s)
    allowed_inputs = interaction_input_names(interaction) + METADATA_FIELDS

    if (provided_inputs - allowed_inputs).empty?
      assignment_detail_tasks.create! user: user, interaction: interaction, kind: kind, data: data
    else
      raise "Data has invalid inputs"
    end
  end


  # ===== Progress ===== #

  def progress
    progress_tasks.inject({}) do |memo, task|
      memo[task.interaction] ||= {}
      memo[task.interaction].merge! task.data
      memo
    end
  end

  def progress_tasks
    assignment_detail_tasks.where(kind: "progress").order(created_at: :asc)
  end

  def progress_complete?(interaction)
    config = interactions[interaction]
    values = progress[interaction]

    if config && values
      input_names = config.form.sections.map(&:inputs).flatten.map(&:name)
      if (input_names - values.keys).empty?
        return true
      end
    end

    false
  end



  # ===== Interactions ===== #

  def interactions
    Hashie::Mash.new(
      badge_requirements.inject({}) do |memo, requirement|
        config = Assignment.all_interactions[requirement.interaction_kind]
        memo[requirement.interaction_key] = config
        memo
      end
    )
  end

  def get_interaction(name)
    interactions[name] || raise("Unknown interaction '#{name}'")
  end

  def interaction_input_names(name)
    get_interaction(name).form.sections.map(&:inputs).flatten.map(&:name)
  end

  def complete_interaction!(interaction)
    badge_requirement = badge_requirements.find{ |req| req.interaction_key == interaction }

    params = {
      content: completion_content_blocks(interaction),
      name: "Lesson Plan for #{resource.name}",
      kind: badge_requirement.created_resource_kind
    }

    resource = Resource.new_with_content(params, assignment.user)
    if resource.save!
      transaction do
        badge_assertion = badge_requirement.earn!(assignment.user, resource)
        assignment_detail_tasks.create! user: assignment.user,
          interaction: interaction,
          kind: "complete",
          resource_id: resource.id,
          data: { badge_assertion_id: badge_assertion.try(:id) }
      end
    end
  end

  def interaction_complete_task(interaction)
    assignment_detail_tasks.where(interaction: interaction, kind: "complete").first
  end

  def interaction_complete?(interaction)
    !!interaction_complete_task(interaction)
  end


  private


  # ===== Content creation ===== #

  def completion_content_blocks(interaction)
    if config = interactions[interaction]
      values = progress[interaction]

      config.form.sections.inject([]) do |memo, section|
        if section.name
          memo << { kind: "html", title: section.name }
        end

        section.inputs.each do |input|
          if input.title
            memo << { kind: "html", content: "<h3>#{input.title || input.label}</h3>" }
          end

          value = values[input.name]
          if input.type == "file"
            if value["id"]
              memo << { kind: "file", uploaded_file_id: value["id"] }
            else
              memo << { kind: "file", file: value }
            end
          else
            memo << { kind: "html", content: value }
          end
        end

        memo
      end
    else
      raise "No configuration for interaction '#{interaction}'"
    end
  end

end

