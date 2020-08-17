# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  refuse_coverage_drop
  add_filter %r{^/(?!app|lib)/}
  add_filter %r{^/app/channels/}
  add_filter 'app/mailers/application_mailer.rb'
  add_filter %r{^/app/jobs/}
  add_filter '.gems'
end

RSpec::Matchers.define_negated_matcher :not_change, :change

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = :random
end
