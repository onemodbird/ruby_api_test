class CampaignMailer < ApplicationMailer
  def campaign(template)
    mail to: "nobody@#{Secrets.brand.domain}",
      subject: "Campaign Subject",
      template_name: template
  end
end
