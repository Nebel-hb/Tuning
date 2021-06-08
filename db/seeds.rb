# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(email: "music@music.com", password: "000000")
User.create!(name: "user1", email: "musician1@music.com", password: "111111" ,role: 1, instrument_id: 2, area_id: 1)
User.create!(name: "user2", email: "musician2@music.com", password: "222222",role: 1, instrument_id: 20, area_id: 1)
User.create!(name: "orchestra1", email: "orchestra1@music.com", password: "aaaaaa",role: 2, instrument_id: 1, area_id: 3)
User.create!(name: "orchestra2", email: "orchestra2@music.com", password: "bbbbbb",role: 2, instrument_id: 1, area_id: 4)

Recruitment.create!(user_id: 3, area_id: 1, title: "演奏会1", recruit_introduction: "初めての演奏会です。")
Recruitment.create!(user_id: 3, area_id: 2, title: "演奏会2", recruit_introduction: "２回目の演奏会です。")
Recruitment.create!(user_id: 4, area_id: 3, title: "演奏会3", recruit_introduction: "３回目の演奏会です。")
Recruitment.create!(user_id: 4, area_id: 4, title: "演奏会4", recruit_introduction: "４回目の演奏会です。")

Orchestra.create!(user_id: 1, application_comment: "８回目の演奏会です。")
Orchestra.create!(user_id: 2, application_comment: "９回目の演奏会です。")

Room.create!(user_id: 3, room_name: "演奏会3")


["関東","関西","中部","北陸","北海道","東北","中国","四国","九州"].each do |name|
  Area.create!({area_name: name})
end

["オーケストラ", "フルート", "オーボエ", "クラリネット", "ファゴット", "トランペット", "トロンボーン", "ホルン", "チューバ",
"バイオリン", "ヴィオラ", "チェロ", "コントラバス", "パーカッション", "ティンパニ", "ドラム",
"チェレスタ", "ピアノ", "クラヴィコード", "チェンバロ"].each do |name|
  Instrument.create!({instrument_name: name})
end