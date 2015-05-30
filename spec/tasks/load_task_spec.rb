require 'spec_helper'
require 'rake'

RSpec.describe "loads namespace rake tasks", type: :rake do
  before :all do
    Rake.application.rake_require "tasks/loads"
    Rake::Task.define_task(:environment)
  end

  describe 'loads:stars' do

    let :run_rake_task do
      Rake::Task["loads:stars"].reenable
      Rake.application.invoke_task "loads:stars"
    end

    it "should load stars" do
      expect_any_instance_of(LoadStar).to receive(:process)
      run_rake_task
    end
  end
end
