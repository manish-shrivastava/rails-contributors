ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require_relative 'support/assert_contributor_names'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  TODAY = Time.zone.parse('2012-12-26')

  fixtures :all

  def time_travel(&block)
    Delorean.time_travel_to(TODAY, &block)
  end

  def read_fixture(name)
    File.read("#{Rails.root}/test/fixtures/#{name}")
  end
end
