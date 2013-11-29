require 'spec_helper'

describe "Rake Tasks meetup:" do
  require 'rake'
  before do
    Rake.application.rake_require "tasks/meetup"
    Rake::Task.define_task(:environment)
  end

  let :run_rake_task do
    Rake::Task[task_name].reenable
    Rake.application.invoke_task task_name
  end

  describe "upcoming" do
    let(:task_name) { "meetup:upcoming" }
    it "should successfully delegate to Meetup class" do
      Event.should_receive(:import_meetup_events).with(:upcoming)
      run_rake_task
    end
  end

  describe "historic" do
    let(:task_name) { "meetup:historic" }
    it "should successfully delegate to Meetup class" do
      Event.should_receive(:import_meetup_events).with(:historic)
      run_rake_task
    end
  end

end
