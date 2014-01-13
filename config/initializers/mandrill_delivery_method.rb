module Sprout
  class MandrillDeliveryMethod
    # mail module specification has one argument
    def initialize(opts)
    end

    # provide custom delivery method using mandrill, must implement deliver!
    # References:
    # 1. http://help.mandrill.com/entries/23257181-Using-the-Mandrill-Ruby-Gem
    # 2. https://gist.github.com/d11wtq/1176236
    # 3. http://mdushyanth.wordpress.com/2011/08/06/custom-mail-delivery-method-in-rails-3/
    def deliver!(mail)
      # construct message object with text and html parts
      message = {
       subject:    mail.subject,
       from_email: mail.from.first,
       from_name:  mail[:from].display_names.first,
       to: [
         {
           email: mail.to.first,
           name:  mail[:to].display_names.first
         }
       ],
       text: mail.text_part.body.raw_source,
       html: mail.html_part.body.raw_source
      }

      # send via mandrill API
      Rails.configuration.mandrill_mailer.messages.send(message)
    end
  end
end

ActionMailer::Base.add_delivery_method :mandrill, Sprout::MandrillDeliveryMethod
