# -*- encoding : utf-8 -*-
Farse.init :application_id  => "your_application_id",
           :api_key         => "your_REST_API_Key"

profile = Farse::Object.new "Profile"
profile["first_name"]    = "John"
profile["last_name"]     = "Doe"
profile["username"]      = "jdoe"
profile["email_address"] = "jdoe@fubar.com"
profile["birthday"]      = Farse::Date.new "1980-12-25"
profile.save

profile.increment "login_count"

# Queries
cls = "GameScore"
(1..100).each { |i|
  score = Farse::Object.new cls
  score["score"] = i
  score.save
}

Farse::Query.new(cls)       \
  .greater_eq("score", 10)  \
  .less_eq("score", 20)     \
  .get

Farse::Query.new(cls)                   \
  .value_in("score", [10, 20, 30, 40])  \
  .get

# Pushes
push = Farse::Push.new({ "alert"=> "I'm sending this push to all my app users!" })
push.save

