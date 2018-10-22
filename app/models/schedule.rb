class Schedule < ApplicationRecord
  belongs_to :user

  FROM_TIME = (1..11).map{|n| (n.to_s + " AM")} + ["12 PM Noon"] + (1..11).map{|n| (n.to_s+ " PM")} + ["12 AM Midnight"]


  END_TIME = (2..11).map{|n| (n.to_s + " AM")} + ["12 PM Noon"] + (1..11).map{|n| (n.to_s+ " PM")} + ["12 AM Midnight"]
end
