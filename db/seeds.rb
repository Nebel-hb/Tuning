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