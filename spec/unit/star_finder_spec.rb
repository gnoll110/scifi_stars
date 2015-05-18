require "rails_helper"

RSpec.feature "Star Finder", :type => :unit do
  describe 'StarFinder.active' do
    it 'returns only active users' do
      # setup
      #search = create(:star_finder, active: true)
      #non_active_user = create(:star_finder, active: false)
      search = StarFinder.new

      # exercise
      result = search.find('Tavonni')

      # verify
      expect(result).to eq 'NotFound'

      # teardown is handled for you by RSpec
    end
  end
end
