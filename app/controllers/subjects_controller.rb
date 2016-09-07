class SubjectsController < APIController
  def index
    subjects = Appo::ResourceTags::SUBJECTS_AND_TOPICS
    render json: { subjects: subjects }
  end
end
