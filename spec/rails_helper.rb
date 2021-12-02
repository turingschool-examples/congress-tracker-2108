# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('HIDE MY KEY') { ENV['govt_api_key'] }
  config.configure_rspec_metadata!
  config.default_cassette_options = { re_record_interval: 10.days }
end

def senate_member_data 
  {:id=>"B001288",
    :title=>"Senator, 2nd Class",
    :short_title=>"Sen.",
    :api_uri=>"https://api.propublica.org/congress/v1/members/B001288.json",
    :first_name=>"Cory",
    :middle_name=>nil,
    :last_name=>"Booker",
    :suffix=>nil,
    :date_of_birth=>"1969-04-27",
    :gender=>"M",
    :party=>"D",
    :leadership_role=>nil,
    :twitter_account=>"SenBooker",
    :facebook_account=>nil,
    :youtube_account=>"SenCoryBooker",
    :govtrack_id=>"412598",
    :cspan_id=>"84679",
    :votesmart_id=>"76151",
    :icpsr_id=>"41308",
    :crp_id=>"N00035267",
    :google_entity_id=>"/m/06p430",
    :fec_candidate_id=>"S4NJ00185",
    :url=>"https://www.booker.senate.gov",
    :rss_url=>nil,
    :contact_form=>"https://www.booker.senate.gov/?p=contact",
    :in_office=>false,
    :cook_pvi=>nil,
    :dw_nominate=>-0.592,
    :ideal_point=>nil,
    :seniority=>"7",
    :next_election=>"2020",
    :total_votes=>717,
    :missed_votes=>290,
    :total_present=>1,
    :last_updated=>"2020-12-30 19:01:18 -0500",
    :ocd_id=>"ocd-division/country:us/state:nj",
    :office=>"717 Hart Senate Office Building",
    :phone=>"202-224-3224",
    :fax=>"202-224-8378",
    :state=>"NJ",
    :senate_class=>"2",
    :state_rank=>"junior",
    :lis_id=>"S370",
    :missed_votes_pct=>40.45,
    :votes_with_party_pct=>83.37,
    :votes_against_party_pct=>16.63}
end 

def house_member_data 
  {
    "id": "D000197",
    "name": "Diana DeGette",
    "first_name": "Diana",
    "middle_name": nil,
    "last_name": "DeGette",
    "suffix": nil,
    "role": "Representative",
    "gender": "F",
    "party": "D",
    "times_topics_url": nil,
    "twitter_id": "RepDianaDeGette",
    "facebook_account": "DianaDeGette",
    "youtube_id": "RepDianaDeGette",
    "seniority": "26",
    "next_election": "2022",
    "api_uri": "https://api.propublica.org/congress/v1/members/D000197.json",
    "district": "1",
    "at_large": false
}
end 