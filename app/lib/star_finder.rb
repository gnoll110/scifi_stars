class StarFinder
  def find(search)
    star = Star.find_by(name: search)
    if star == nil
      result = 'NotFound'
    else
      result = star.name
    end
    return result
  end
end
