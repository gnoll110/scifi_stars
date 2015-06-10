require "rails_helper"

RSpec.feature "Load Star", :type => :unit do
  describe '.process' do
    it 'against...' do
      loader = LoadStar.new
      #loader.process
      expect().to eq ''
    end

    it 'against...' do
      string = '==Film and television==\n'+
               '\n'+
               '===Star Trek===\n'+
               'The items in this subsection all refer to works in the film, television, and print franchise '+
               'originated by [[Gene Roddenberry]].\n'+
               '* "[[Where No Man Has Gone Before]]" (1966), '+
               "second pilot episode of ''[[Star Trek: The Original Series]]'' written by [[Samuel A. Peeples]]. "+
               'The powerful—and dangerous—newly minted telepath Gary Mitchell reminisces with his old friend Captain Kirk '+
               "about a wild shore leave they once spent together on '''Deneb IV''', a planet of paranormal adepts, "+
               'where he had already displayed high psychic potential. Mitchell embellishes his side of the account '+
               'with the tale of an intense romantic encounter with a Denebian woman he describes as a "nova." '+
               "(For a contrasting perspective on Mitchell's views about women see "+
               '"[[Aldebaran in fiction#Star Trek|walking freezer unit]].")'
               '* "[[I, Mudd]]" (1967), episode of '+
               "''[[Star Trek: The Original Series]]'' written by [[Gene Roddenberry]] and [[David Gerrold]] (uncredited). "+
               "The USS ''Enterprise'' is hijacked by a mysterious android and taken to an unnamed planet, populated by "+
               "hundreds of thousands of his fellows, and by one Harcourt Fenton Mudd, a hapless con-man known to Captain Kirk. "+
               "The androids, assisted by Harry Mudd, plot to commandeer the ''Enterprise'', take over the galaxy, "+
               "and control—and serve—humanity forever in a sort of cosmic nanny state. The crew of the ''Enterprise'' "+
               'overcome their robotic captors by using the classic ruse of beguiling them with paradoxes, '+
               "but not before Mr. Spock has occasion to remind Mudd of the penalty for fraud on '''Deneb V''': "+
               "capital punishment, with the means freely chosen by the condemned. (Compare Rigel: "+
               '"[[Rigel in fiction#Star Trek|Mudd\'s Women]]".)'
      source = StringSource.new(string)
      loader = LoadStar.new(source)
      loader.process
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
