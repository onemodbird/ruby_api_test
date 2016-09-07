module NotificationHelpers
  def expect_notification(subject_match, users)
    users = [users].flatten
    mails = mailbox.last(users.count)

    mails.each { |mail| expect(mail.subject).to match subject_match }
    expect(mails.map{ |mail| mail.to }.flatten).to match_array users.map(&:email)
  end

  def expect_realtime(key, to:, excluding: [])
    to = Array(to)
    excluding = Array(excluding)

    allow(RealtimeService).to receive(:publish)

    excluding.each do |user|
      expect(RealtimeService)
        .not_to receive(:publish)
        .with(user, key.to_s, any_args)
    end

    (to - excluding).each do |user|
      expect(RealtimeService)
        .to receive(:publish)
        .with(user, key.to_s, any_args)
    end
  end
end
