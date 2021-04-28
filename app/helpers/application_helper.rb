# frozen_string_literal: true

module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Right Guardians【ディスティニー2】'

    page_title.empty? ? "【Destiny2】" + base_title : page_title + " | " + base_title
  end
end