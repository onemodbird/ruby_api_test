class CampaignMailerPreview < ActionMailer::Preview
  if Rails.env.development?
    Dir[Rails.root.join("app/views/campaign_mailer/*.html.haml")].each do |f|
      campaign = File.basename(f, ".html.haml")

      define_method(campaign) do
        CampaignMailer.campaign(campaign)
      end
    end
  end
end
