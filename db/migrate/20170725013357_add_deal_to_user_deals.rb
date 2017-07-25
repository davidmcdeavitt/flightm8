class AddDealToUserDeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_deals, :deal, foreign_key: true
  end
end
