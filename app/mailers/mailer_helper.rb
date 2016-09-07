module MailerHelper
  def absolutely_path(path)
    [Secrets.site_url, path].join("/")
  end
end
