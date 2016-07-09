class Link < ApplicationRecord

  def self.encrypt(url)

    unless url.include? "http://"
      url = "http://#{url}"
    end

    if Link.find_by("original = ?", url)
      link = Link.find_by("original = ?", url)
      return link.short
    end

    newlink = Link.new(original: url)

    letters = []
    ("a".."z").each do |letter|
      letters.push(letter)
    end
    ("A".."Z").each do |letter|
      letters.push(letter)
    end
    path = []
    path.push(letters[rand(0..(letters.length-1))])
    path.push(letters[rand(0..(letters.length-1))])
    path.push(letters[rand(0..(letters.length-1))])
    result = path.join("")

    if Link.find_by("short = ?", result)
      encrypt(url)
    else
      newlink.short = result
      newlink.save
      return result
    end
  end
end
