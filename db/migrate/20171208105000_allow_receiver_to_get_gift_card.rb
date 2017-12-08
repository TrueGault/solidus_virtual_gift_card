class AllowReceiverToGetGiftCard < ActiveRecord::Migration
  def change
    add_column :spree_virtual_gift_cards, :send_to_purchaser, :boolean, default: false, null: false
  end
end
