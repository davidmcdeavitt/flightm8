class Api::UsersController < ApplicationController
  include UsersHelper

  def preferreddeals
    result={}
    userPref = Preference.find_by(user_id: current_user)
    regionSet = []
    if userPref[:asia] == 1
      regionSet.concat Deal.where(asia: 1)
    end
    if userPref[:europe] == 1
      regionSet.concat Deal.where(europe: 1)
    end
    if userPref[:oceania] == 1
      regionSet.concat Deal.where(oceania: 1)
    end
    if userPref[:northamerica] == 1
      regionSet.concat Deal.where(northamerica: 1)
    end
    if userPref[:southamerica] == 1
      regionSet.concat Deal.where(southamerica: 1)
    end
    if userPref[:africa] == 1
      regionSet.concat Deal.where(africa: 1)
    end
    priceMin = Deal.where('price >= ?',userPref[:price_min])
    priceMax = Deal.where('price <= ?',userPref[:price_max])
    dateMin = Deal.where('date_start >= ?',userPref[:date_start_travel])
    dateMax = Deal.where('date_end <= ?',userPref[:date_end_travel])
    deals = regionSet & priceMin & priceMax & dateMin & dateMax
    result[:deals] = dealsToJson(deals)
    result[:userPref] = userPrefToJson(userPref)

    render json: result
  end

  def saveddeals
    result = []
    savedDeals = UserDeal.where(user_id:current_user)
    savedDeals.each do |savedDeal|
      deal = Deal.find(savedDeal.deal_id)
      result.push(deal)
    end
    render json: result
  end

  def dealsToJson(preferredDeals)
    jsonResult = []
    savedDealIdList = []
    savedDeals = UserDeal.where(user_id:current_user)
    savedDeals.each do |savedDeal|
      deal = Deal.find(savedDeal.deal_id)
      savedDealIdList.push(deal.id)
    end
    preferredDeals.each do |deal|
      jsonResult.push({
        :id => deal.id,
        :image_url => deal.image_url,
        :title => deal.title,
        :description => deal.description,
        :price => deal.price,
        :date_start => deal.date_start,
        :date_end => deal.date_end,
        :created_at => deal.created_at,
        :updated_at => deal.updated_at,
        :asia => deal.asia,
        :europe => deal.europe,
        :africa => deal.africa,
        :oceania => deal.oceania,
        :northamerica => deal.northamerica,
        :southamerica => deal.southamerica,
        :is_favorite => (savedDealIdList.include? deal.id)
      })
    end
    jsonResult
  end

  def userPrefToJson(userPref)
    jsonResult = {
      :price_max => userPref.price_max,
      :image_url => userPref.price_min,
      :title => userPref.asia,
      :price => userPref.europe,
      :date_start => userPref.southamerica,
      :date_end => userPref.northamerica,
      :created_at => userPref.africa,
      :updated_at => userPref.oceania,
      :asia => userPref.date_start_travel,
      :europe => userPref.date_end_travel,
      :africa => userPref.user_id,
    }
    jsonResult
  end

  def alldeals
    deals = Deal.all
    render json: deals
  end
end
