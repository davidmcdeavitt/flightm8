class AddUserToUserDeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_deals, :user, foreign_key: true
  end
end
