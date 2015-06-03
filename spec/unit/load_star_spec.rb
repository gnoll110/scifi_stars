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
      source = StringSource.new(string)
      loader = LoadStar.new(source)
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
      source = ArraySource.new(array)
      loader = LoadStar.new(source)
      #loader.process
      expect().to eq ''
    end
  end
end
