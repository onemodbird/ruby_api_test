module Appo
module Formatters
class ArticleUser

  def initialize(user)
    @user = user
  end

  attr_reader :user

  def to_h
    {
      id: user.fetch('id'),
      name: user.fetch('name'),
      profile_photo_url: user.fetch('profile_photo_url')
    }
  end

end
end
end
