class ReminderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.network_reminder.subject
  #
  def network_reminder
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
