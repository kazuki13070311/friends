# frozen_string_literal: true

module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Right Guardians【ディスティニー2】'

    page_title.empty? ? "【Destiny2】" + base_title : page_title + " | " + base_title
  end

  def default_meta_tags
    {
      site: 'ソロガーディアン救済サイト',
      title: '【Destiny2】Right Guardians',
      reverse: true,
      charset: 'utf-8',
      description: 'フレンド募集やクラン募集やクラメン募集などができるDestiny2における理想のフレンド作りを目的とした完全無料のサービスです。フレンド登録後のミスマッチを防ぎ自分が求める理想のユーザーと出会えるのがこのサービスの特徴です。',
      separator: '|',
      icon: [
        { href: image_url('destiny2-icon.jpg')},
        { href: image_url('destiny2-icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        image: image_url('destiny2-twitter1.jpg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@kattyan1307',
      }
    }
  end
end