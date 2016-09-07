class SystemMailerPreview < ActionMailer::Preview
  def feedback
    user = random(:user)
    SystemMailer.feedback(
      Faker::Lorem.words(3).join("_"), 
      Faker::Lorem.paragraph,
      Faker::Internet.email,
      user.id)
  end

  private

  def random(thing)
    thing.to_s.camelize.constantize.order("RANDOM()").first
  end
end
