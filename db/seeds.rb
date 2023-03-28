# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@email.com',
    password: 'nekomachi',
)


end_users = EndUser.create!(
  [
    {email: 'tanaka@test.com', last_name: '田中', fast_name: '太郎', nick_name: 'たなっし', telephone_number: '09012345678', password: 'tanaka', is_deleted: 'false', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'yoshida@test.com', last_name: '吉田', fast_name: '勝', nick_name: '勝', telephone_number: '09023456789', password: 'masaru', is_deleted: 'false',profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'takahashi@test.com', last_name: '高橋', fast_name: '道子', nick_name: 'みっちゃん', telephone_number: '08012345678', password: 'michiko', is_deleted: 'false',profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'mishima@test.com', last_name: '三島', fast_name: '聡', nick_name: 'サト', telephone_number: '09034567890', password: 'satoru', is_deleted: 'false', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'kamiyama@test.com', last_name: '神山', fast_name: '裕人', nick_name: 'HIRO', telephone_number: '09021212345', password: 'hiroto', is_deleted: 'false', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")}
  ]
)


PostMachineko.create!(
  [
    {end_user_id: '1', shot_address: '岩手県二戸市 公園近く', latitude: '35.16436891666606', longitude: '135.04067248255615', caption: '日向ぼっこしてました〜三毛猫', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg") },
    {end_user_id: '1', shot_address: '福井県敦賀市 ドンキホーテ前', latitude: '35.64472588477449', longitude: '136.0564696761963', caption: '三毛猫君が睨んできてました', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg") },
    {end_user_id: '4', shot_address: '静岡県静岡市 駿府城', latitude: '34.97714919556868', longitude: '138.38293479206544', caption: 'もうちょっとで寝そうな三毛猫ちゃん', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg") },
    {end_user_id: '5', shot_address: '京都府京都市 コンビニ前', latitude: '35.010896162033525', longitude: '135.75836420151367', caption: '立派な顔立ち！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg") },
    {end_user_id: '1', shot_address: '長野県上田市 千曲川', latitude: '36.39680029809969', longitude: '138.24332434387205', caption: 'ボス！お疲れ様です！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg") },
    {end_user_id: '5', shot_address: '新潟県魚沼市 ラーメン屋近く', latitude: '37.22995121900344', longitude: '138.96485014183347', caption: '黒猫君が足元に！！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg") },
    {end_user_id: '5', shot_address: '福島県東白川郡 北野神社', latitude: '36.94898380783617', longitude: '140.4814433143555', caption: '三毛猫「通ってよし」', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg") },
    {end_user_id: '4', shot_address: '愛知県名古屋市 電力会社付近', latitude: '35.17257587197507', longitude: '136.90767289895018', caption: 'まだちっちゃい黒猫と出会しました', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg") },
    {end_user_id: '3', shot_address: '秋田県横手市 かまくら館前', latitude: '39.31349626863497', longitude: '140.56710278413087', caption: '黄昏猫', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg") },
    {end_user_id: '4', shot_address: '愛媛県新居浜市 役所前', latitude: '33.95971807717303', longitude: '133.2825334931152', caption: '旅行先の駐車場にて黒猫', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post10.jpg"), filename:"sample-post10.jpg") },
    {end_user_id: '3', shot_address: '茨城県稲敷郡 貝塚辺り', latitude: '35.99964776830296', longitude: '140.29878318255618', caption: 'お天気気持ちいいね〜三毛猫君', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post12.jpg"), filename:"sample-post12.jpg") },
    {end_user_id: '1', shot_address: '岐阜県岐阜市 展望台', latitude: '35.42226853803448', longitude: '136.76641527147214', caption: '草むらでお昼寝中', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post14.jpg"), filename:"sample-post14.jpg") },
    {end_user_id: '3', shot_address: '滋賀県東近江市 動物病院近く', latitude: '35.11346853335752', longitude: '136.2089054756714', caption: 'ラブラブな黒猫白猫！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post15.jpg"), filename:"sample-post15.jpg") },
    {end_user_id: '5', shot_address: '福岡県朝倉市 天木公園', latitude: '33.42633310105359', longitude: '130.66716843704833', caption: 'そんな無防備なの？？', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post16.jpg"), filename:"sample-post16.jpg") }
  ]
)