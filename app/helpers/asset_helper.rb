module AssetHelper
  def cdn_url_for(location)
    Secrets.cdn_url.chomp("/") + "/" + location.sub(/^\//, "")
  end
end
