require 'mediawiki_api'
require 'kramdown'

class LoadStar
  def initialize(source=nil)
    class_name = source.class.to_s+'Source'
    @sources = class_name.constantize.new(source)
  end

  def process
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

class NilClassSource
  def initialize(source)
  end

  def process
  end
end

class StringSource
  def initialize(source)
    @sources = source
  end

  def process
  end
end

class ArraySource
  def initialize(source)
    @sources = source
  end

  def process
    @sources.each do | page |
      puts '>'+page
    end    
  end
end
