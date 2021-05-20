crumb :root do
  link "Home", root_path
end

crumb :users_index do
  link "ユーザー一覧", users_path
  parent :root
end

crumb :users_show do |user|
  link "#{user.name}さんのプロフィール", users_path(user)
  parent :users_index
end

crumb :microposts_index do
  link "ガラスの間の募集一覧", microposts_path
  parent :root
end

crumb :microposts_show do |user|
  link "募集内容の詳細", microposts_path(user)
  parent :microposts_index
end

crumb :friends_index do
  link "募集一覧", friends_path
  parent :root
end

crumb :friends_show do |user|
  @friend = Friend.find(params[:id])
  user = @friend.user
  link "#{@friend.name}の詳細", friends_path(user)
  parent :friends_index
end

crumb :friends_new do
  link "募集投稿ページ", friends_path(user)
  parent :friends_index
end

crumb :posts_index do
  link "自慢の一枚一覧", posts_path
  parent :root
end

crumb :posts_show do |user|
  link "投稿詳細ページ", posts_path(user)
  parent :posts_index
end

crumb :posts_ranking do
  link "評価ランキング", posts_ranking_path
  parent :posts_index
end

crumb :homes_sitenav do
  link "サイトの使い方", homes_sitenav_path
  parent :root
end

crumb :homes_term do
  link "利用規約", homes_term_path
  parent :root
end

crumb :homes_privacy do
  link "プライバシーポリシー", homes_privacy_path
  parent :root
end

crumb :users_following do |user|
  link "#{user.name}さんがフォローしているユーザー", following_user_path
  parent :root
end

crumb :users_follower do |user|
  link "#{user.name}さんのフォロワー", followers_user_path
  parent :root
end

crumb :new_user_registration do |user|
  link "ログイン画面", few_user_registration_path
  parent :root
end