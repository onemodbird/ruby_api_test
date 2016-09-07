module Linkable
  extend ActiveSupport::Concern

  def link
    [Secrets.site_url,
      link_resource_path.dasherize,
      name.parameterize,
      id].join("/")
  end

  def link_resource_path
    self.class.name.demodulize.pluralize.downcase
  end
end
