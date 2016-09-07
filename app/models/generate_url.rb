class GenerateUrl

  RECORD_PATHS = {
    Article: -> (record) { "articles" },
    Collection: -> (record) { "collections" },
    Resource: -> (record) { record.content_type.dasherize.pluralize }}

  def self.for(record)
    path = RECORD_PATHS.fetch(record.class.name.to_sym).call(record)
    [ Secrets.site_url, path, record.name.parameterize, record.id ].join("/")
  end
end
