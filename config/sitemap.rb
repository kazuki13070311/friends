# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://guardians-community.com/"

SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.create do
  add posts_path :priority => 0.7, :changefreq => 'daily'
  add users_path :priority => 0.7, :changefreq => 'daily'
  add root_path, :priority => 0.7, :changefreq => 'daily'

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #
  # Add all articles:
  #
  # '/friend/:id' を追加する
  Friend.find_each do |friend|
    add friend_path(friend), :lastmod => friend.updated_at
  end

  User.find_each do |user|
    add user_path(user), :lastmod => user.updated_at
  end

  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end
end
