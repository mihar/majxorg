# Encoding: utf-8

class String

  def make_websafe
    self.strip.gsub('d.d.', '').gsub('d.o.o.', '').strip.debalkanize.downcase.gsub(' ', '-').gsub(',', '').gsub('.', '').strip
  end

  def debalkanize
    self.gsub('Č', 'C').gsub('Š', 'S').gsub('Ž', 'Z').gsub('Ć', 'C').gsub('Đ', 'D').gsub('č', 'c').gsub('š', 's').gsub('ž', 'z').gsub('ć', 'c').gsub('đ', 'd')
  end

  def debalkanize!
    replace self.debalkanize
  end

  def make_file_system_friendly
    self.strip.debalkanize.downcase.gsub(' ', '_')
  end
  
  def strip_html
    self.gsub(/<\/?[^>]*>/, "")
  end
  
  def shorten(count = 30)
  	if self.length >= count 
  		shortened = self[0, count]
  		splitted = shortened.split(/\s/)
  		words = splitted.length
  		splitted[0, words-1].join(" ") + ' ...'
  	else 
  		self
  	end
  end
  
  def to_permalink
    separator = '-'
    
    # words to ignore, usually the same words ignored by search engines
    ignore_words = ['and', 'or']
    ignore_re    = String.new

    # building ignore regexp
    ignore_words.each{ |word|
      ignore_re << word + '\b|\b'
    }
    ignore_re = '\b' + ignore_re + '\b'

    # shorten to max 8 words
    permalink = self.shorten 8
    
    # replace apostrophes with separator
    permalink = self.gsub("'", separator)

    # delete ignore words
    permalink = self.gsub(ignore_re, '')

    # all down
    permalink = self.downcase

    # shift whitespace and preserve all alphanumeric characters
    permalink.strip.debalkanize.gsub(" ", separator).gsub(/[^a-z0-9\-]+/, "")
  end
end