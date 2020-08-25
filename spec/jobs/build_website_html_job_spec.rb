require 'rails_helper'

RSpec.describe BuildWebsiteHtmlJob, type: :job do
  let!(:website_config) { create :website_config }
  let!(:website_build) { create :website_build }

  it "enqueue job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      BuildWebsiteHtmlJob.perform_later(website_config)
    }.to enqueue_job
  end

  it "matches with performed job" do
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    BuildWebsiteHtmlJob.perform_later(website_config)
    expect(BuildWebsiteHtmlJob).to have_been_performed
  end

  it "matches passed arguments" do
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    BuildWebsiteHtmlJob.perform_later(website_config)
    expect(BuildWebsiteHtmlJob).to(
      have_been_performed.with(website_config)
    )
  end

  it "matches job perform time" do
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    ActiveJob::Base.queue_adapter.perform_enqueued_at_jobs = true
    BuildWebsiteHtmlJob.set(wait_until: Date.tomorrow.noon).perform_later(website_config)
    expect(BuildWebsiteHtmlJob).to have_been_performed.at(Date.tomorrow.noon)
  end

    it "matches job queue name" do
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    BuildWebsiteHtmlJob.perform_later(website_config)
    expect(BuildWebsiteHtmlJob).to have_been_performed.on_queue("default")
  end
end
