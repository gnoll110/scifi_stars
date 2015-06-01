require "rails_helper"

RSpec.feature "Load Star", :type => :unit do
  describe '.process' do
    it 'against...' do
      loader = LoadStar.new
      #loader.process
      expect().to eq ''
    end

    it 'against...' do
      string = ""
      loader = LoadStar.new(string)
      #loader.process
      expect().to eq ''
    end

    it 'against...' do
      array = [ "", "" ]
      loader = LoadStar.new(array)
      #loader.process
      expect().to eq ''
    end
  end
end
