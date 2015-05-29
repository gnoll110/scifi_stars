require 'spec_helper'
require 'rake'

RSpec.describe "load_stars_task", type: :rake do
  before :all do
    Rake.application.rake_require "tasks/loads"
    Rake::Task.define_task(:environment)
  end


  it "rakes it out" do
    #expect(subject).to be_a(Rake::Task)
    #expect(subject.name).to eq("load_satars_task")
    #expect(subject).to eq(task)
  end
end
