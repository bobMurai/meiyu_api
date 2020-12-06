# usersデータ作成
5.times do |n|
  User.create!(
    id: n.to_s,
    password: n.to_s + "password",
    nickname: n.to_s + "chan",
    photo_url: "http://aaaa/#{n.to_s}.png",
    email: n.to_s + "@gmail.com",
    nearest_station: n.to_s + "駅",
    birthday: "1995-01-24",
    social_position: "社会人",
    job: "エンジニア",
    introduction: "こんにちは！初めまして！仲良くしてね！"
  )
end

# friend_relationsデータ作成
5.times do |n|
  FriendRelation.create!(
    id: n.to_s
  )
end

# friend_relation_detailsデータ作成
10.times do |n|
  FriendRelationDetail.create!(
    friend_status: 3,
    user_id: (n%5).to_s,
    friend_relation_id: ((n+1)%5).to_s,
  )
end

# chatsデータ作成
5.times do |n|
  Chat.create!(
    content: "hello!",
    friend_relation_id: ((n+1)%5).to_s,
    user_id: n.to_s,
  )
end
