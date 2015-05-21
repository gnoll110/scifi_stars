require 'mediawiki_api'
require 'kramdown'

class LoadStar
  def process
    systems = [ 'Stars_and_planetary_systems_in_fiction',
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

    client = MediawikiApi::Client.new "http://en.wikipedia.org/w/api.php"

    systems.each do | system |
      text = client.get_wikitext system
      body = text.body.force_encoding("UTF-8")
      doc = Kramdown::Document.new(body, :input => 'markdown')
      ele = doc.root
      puts ele.type
      puts ele.value
      children = ele.children
      children.each do | child |
        puts child.type
        puts child.value.to_s
      end
    end
  end
end
