require 'mediawiki_api'
require 'kramdown'

class AbstractSource
  def initialize
  end

  def process(s)
  end
end

class NilSource < AbstractSource
  def initialize
  end

  def process(s)
  end
end

class StringSource < AbstractSource
  def initialize(source)
    @sources = source
  end

  def process(s)
    puts "in StringSource.process"
  end
end

class ArraySource < AbstractSource
  def initialize(source)
    @sources = source
  end

  def process(s)
    puts "in ArraySource.process"
    @sources.each do | page |
      puts '>'+page
    end    
  end
end

class LoadStar
  def initialize(source = NilSource.new)
    @source = source
  end

  def process
    puts "in LoadStar.process | "+@source.class.to_s
    @source.process(self)
    puts "end LoadStar.process"
  end

  def baggage
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
