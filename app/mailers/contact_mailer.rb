class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "the.colledge.dropout@gmail.com", subject:"お問い合わせの確認メール"
  end

  default from: 'from@example.com'
  layout 'mailer'
end
