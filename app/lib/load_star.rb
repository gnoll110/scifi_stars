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
      @depth = 0
      text = client.get_wikitext system
      body = text.body.force_encoding("UTF-8")
      doc = Kramdown::Document.new(body, :input => 'markdown')
      ele = doc.root
      puts ele.type
      puts ele.value
      if ele.type = 'root'
        @depth+=1
        chld ele
      end
    end
  end

  private

  def chld(ele)
    #puts ele.class
    command_class = ele.type.capitalize.to_s+'Command'
    puts command_class
    command = command_class.constantize
    children = ele.children
    #puts children.class
    children.each do | child |
      #puts child.class
      #puts '=a '+ child.to_s
      front_str = ''
      @depth.times do
        front_str+=' '
      end
      puts front_str+'=b>'+child.type.to_s+'<='+child.value.to_s
      @depth+=1
      #puts 'd==='+@depth.to_s
      chld(child)
      #puts '>8>'
      @depth-=1
    end
  end
end

class RootCommand
end

class PCommand
end

class TextCommand
end

class BlankCommand
end

class Html_elementCommand
end

class Xml_commentCommand
end

class UlCommand
end

class LiCommand
end

class EntityCommand
end
