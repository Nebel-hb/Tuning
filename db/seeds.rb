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


["関東","関西","中部","北陸","北海道","東北","中国","四国","九州"].each do |name|
  Area.create!({area_name: name})
end

["オーケストラ", "フルート", "オーボエ", "クラリネット", "ファゴット", "トランペット", "トロンボーン", "ホルン", "チューバ",
"バイオリン", "ヴィオラ", "チェロ", "コントラバス", "パーカッション", "ティンパニ", "ドラム",
"チェレスタ", "ピアノ", "クラヴィコード", "チェンバロ"].each do |name|
  Instrument.create!({instrument_name: name})
end