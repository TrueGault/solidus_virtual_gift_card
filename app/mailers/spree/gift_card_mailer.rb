class Spree::GiftCardMailer < Spree::BaseMailer
  def gift_card_email(gift_card)
    @gift_card = gift_card.respond_to?(:id) ? gift_card : Spree::VirtualGiftCard.find(gift_card)
    @order = @gift_card.line_item.order
    send_to_address = @order.email
    send_to_address = @gift_card.recipient_email unless @gift_card.send_to_purchaser?
    subject = "#{Spree::Store.default.name} #{Spree.t('gift_card_mailer.gift_card_email.subject')}"
    mail(to: send_to_address, from: from_address(Spree::Store.default), subject: subject)
  end
end
