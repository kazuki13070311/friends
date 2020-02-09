# frozen_string_literal: true

if Rails.env.development?
  require 'rack-mini-profiler'

  Rack::MiniProfilerRails.initialize!(Rails.application)
end
