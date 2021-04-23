# frozen_string_literal: true

module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Right Guardians'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end