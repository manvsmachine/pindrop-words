Entry.delete_all

f = File.open('/usr/share/dict/web2')
words = f.readlines.map { |word| word.strip }
words.each do |word|
  Entry.create!(word: word)
end

f.close
