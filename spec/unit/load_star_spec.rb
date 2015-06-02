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
      array = [ 'Stars_and_planetary_systems_in_fiction',
                'Aldebaran_in_fiction',
                'Alpha_Centauri_in_fiction',
                'Altair_in_fiction',
                'Betelgeuse_in_fiction',
                'Deneb_in_fiction',
                'Epsilon_Eridani_in_fiction',
                'Rigel_in_fiction',
                'Sirius_in_fiction',
                'Tau_Ceti_in_fiction',
                'Vega_in_fiction' ]
      loader = LoadStar.new(array)
      #loader.process
      expect().to eq ''
    end
  end
end
