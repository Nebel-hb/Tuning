# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(email: "music@music.com", password: "000000")
User.create!(name: "Maco", email: "musician.maco@music.com", password: "111111" ,role: 1, instrument_id: 2, area_id: 1, introduction: "〇〇音楽大学１８年卒　フルート専攻　△△教授門下生　大学オーケストラにて経験あり。　ブラームス３番 2st , チャイコフスキー　シンデレラ１st 等")
User.create!(name: "An", email: "musician.an@music.com", password: "222222",role: 1, instrument_id: 8, area_id: 1, introduction: "〇〇フィルオーケストラ所属　ハイトーンも得意です。 亡き王女のためのパヴァーヌが好きでよく吹いています")
User.create!(name: "Nebel", email: "musician.nebel@music.com", password: "333333" ,role: 1, instrument_id: 20, area_id: 1,  introduction: "〇〇音楽大学　専攻はピアノでしたが、副科でチェンバロを学び夢中になりました。卒業後も□□先生に教わり、通奏低音も弾けます。")
User.create!(name: "フィルハーモニー管弦楽団", email: "orchestra@music.com", password: "aaaaaa",role: 2, instrument_id: 1, area_id: 1, introduction: "信頼できる仲間と楽しい音楽を！をモットーに活動しています。練習は月１回で年１回の定期演奏会に向けて練習しています。　昨年は、惑星より火星、冥王星、金星、木星等に挑戦しました。" )
User.create!(name: "バロックアンサンブル", email: "mbaroque@music.com", password: "bbbbbb" ,role: 2, instrument_id: 22 , area_id: 1,  introduction: "千葉県でバロックを愛する仲間と活動しています")
# User.create!(name: "user6", email: "musician6@music.com", password: "222222",role: 1, instrument_id: 20, area_id: 1)
# User.create!(name: "user11", email: "musician11@music.com", password: "111111" ,role: 1, instrument_id: 2, area_id: 1)
# User.create!(name: "user12", email: "musician12@music.com", password: "222222",role: 1, instrument_id: 20, area_id: 1)
# User.create!(name: "user13", email: "musician13@music.com", password: "111111" ,role: 1, instrument_id: 2, area_id: 1)
# User.create!(name: "user14", email: "musician14@music.com", password: "222222",role: 1, instrument_id: 20, area_id: 1)
# User.create!(name: "user15", email: "musician15@music.com", password: "111111" ,role: 1, instrument_id: 2, area_id: 1)
# User.create!(name: "user16", email: "musician16@music.com", password: "222222",role: 1, instrument_id: 20, area_id: 1)
# User.create!(name: "orchestra1", email: "orchestra1@music.com", password: "aaaaaa",role: 2, instrument_id: 1, area_id: 3)
# User.create!(name: "orchestra2", email: "orchestra2@music.com", password: "bbbbbb",role: 2, instrument_id: 1, area_id: 4)

# Recruitment.create!(user_id: 3, area_id: 1, title: "演奏会1", recruit_start: "2021-06-14", recruit_end: "2021-06-15", recruit_event_start: "2021-07-20", recruit_event_end: "2021-07-26", recruit_introduction: "初めての演奏会です。")
# Recruitment.create!(user_id: 3, area_id: 2, title: "演奏会2", recruit_start: "2021-06-08", recruit_end: "2021-06-09", recruit_event_start: "2021-07-15", recruit_event_end: "2021-07-15", recruit_introduction: "２回目の演奏会です。")
# Recruitment.create!(user_id: 4, area_id: 3, title: "演奏会3", recruit_start: "2021-06-16", recruit_end: "2021-06-17", recruit_event_start: "2021-07-22", recruit_event_end: "2021-07-25", recruit_introduction: "３回目の演奏会です。")
# Recruitment.create!(user_id: 4, area_id: 4, title: "演奏会4", recruit_start: "2021-06-18", recruit_end: "2021-06-20", recruit_event_start: "2021-07-30", recruit_event_end: "2021-08-05", recruit_introduction: "４回目の演奏会です。")

# Event.create!(user_id: 3, area_id: 1, title: "演奏会1", start:  "2021-07-14", end: "2021-07-15" ,event_introduction: "初めての演奏会です。")
# Event.create!(user_id: 3, area_id: 2, title: "演奏会2", start:  "2021-07-16", end: "2021-07-16" ,event_introduction: "２回目の演奏会です。")
# Event.create!(user_id: 4, area_id: 3, title: "演奏会3", start:  "2021-07-18", end: "2021-07-28" ,event_introduction: "３回目の演奏会です。")
# Event.create!(user_id: 4, area_id: 4, title: "演奏会4", start:  "2021-07-20", end: "2021-07-30" ,event_introduction: "４回目の演奏会です。")


# # Room.create!(user_id: 3, room_name: "演奏会3")

# EventTag.create!(event_id: 1, tag_id: 4)
# EventTag.create!(event_id: 2, tag_id: 2)
# EventTag.create!(event_id: 3, tag_id: 2)
# EventTag.create!(event_id: 4, tag_id: 1)

["地域","ステージ","公演","コンサート","コンクール"].each do |name|
  Tag.create!({tag_name: name})
end

["関東","関西","中部","北陸","北海道","東北","中国","四国","九州"].each do |name|
  Area.create!({area_name: name})
end

["オーケストラ", "フルート", "オーボエ", "クラリネット", "ファゴット", "トランペット", "トロンボーン", "ホルン", "チューバ",
"バイオリン", "ヴィオラ", "チェロ", "コントラバス", "パーカッション", "ティンパニ", "ドラム",
"チェレスタ", "ピアノ", "クラヴィコード", "チェンバロ","ヴィオラダガンバ","バロックアンサンブル","その他"].each do |name|
  Instrument.create!({instrument_name: name})
end