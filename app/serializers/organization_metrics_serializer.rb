class OrganizationMetricsSerializer
  include Serialization::Serializable

  COMMON = [:id, :name, :type, :learner_count, :badge_assertions_count, :resource_assignments_count]
  STATE = [:districts, :school_count]
  DISTRICT = [:state_id, :schools, :school_count]
  SCHOOL = [:district_id, :state_id]

  attr_reader :object

  # Params:
  # learner(boolean) - Serialize learners for descendant schools
  def initialize(organization, params = {})
    @object = organization
    @params = params

    if params.has_key?(:cache)
      @cache = params[:cache]
    else
      construct_cache
    end
  end

  def construct_cache
    @cache = {}
    @cache[:rollup] = get_rollup
    @cache[:schools] = get_schools if ["State", "District"].include?(object.type)
    @cache[:districts] = get_districts if object.type == "State"
  end

  def keys
    keys_hash = {
      "School" => COMMON + SCHOOL,
      "District" => COMMON + DISTRICT,
      "State" => COMMON + STATE }

    keys_hash[object.type].tap do |keys|
      keys << :learners if @params[:learners]
    end
  end

  def serializable_hash
    keys.inject({}) do |hash, key|
      if respond_to?(key, true)
        hash[key] = public_send(key)
      else
        hash[key] = object.public_send(key)
      end
      hash
    end
  end

  def school_count
    Integer(@cache[:rollup][object.id]["school_count"])
  end

  def learner_count
    Integer(@cache[:rollup][object.id]["learner_count"])
  end

  def badge_assertions_count
    Integer(@cache[:rollup][object.id]["badge_assertions_count"])
  end

  def resource_assignments_count
    Integer(@cache[:rollup][object.id]["resource_assignments_count"])
  end

  def districts
    @cache[:districts].select{ |district| district[:state_id] == object.id }
  end

  def schools
    @cache[:schools].select{ |school| school[:district_id] == object.id }
  end

  def learners
    LearnerSerializer.list(
      object.learners.includes({ badge_assertions: :badge},
        :assignments, :organization_users))
  end

  def get_districts
    OrganizationMetricsSerializer.list(object.districts, cache: @cache )
  end

  def get_schools
    OrganizationMetricsSerializer.list(object.schools, cache: @cache )
  end

  def get_rollup
    OrganizationRollup.rollup(object.descendants(true))
  end
end
