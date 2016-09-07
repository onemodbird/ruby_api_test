class LearningRegistryImportJob
  include Sidekiq::Worker
  sidekiq_options queue: :import

  def perform(data_file, line_number, num_jobs, num_records)
    Appo::Importers::LearningRegistry
      .import_line_number!(data_file, line_number)

  rescue => e
    log_file = Rails.root.join("log", "learning_registry_import.log")
    message = "#{e.class.name} -> #{e.message}"
    File.write(log_file, "#{message}/n", nil, mode: "a")

  ensure
    next_line_number = line_number + num_jobs
    if next_line_number < num_records
      self.class.perform_async(
        data_file,
        next_line_number,
        num_jobs,
        num_records)
    end
  end
end
