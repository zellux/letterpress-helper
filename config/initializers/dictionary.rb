list = []
Entry = Struct.new :word, :count
open("#{Rails.root}/lib/assets/enable2k.txt", 'r').lines.each_with_index do |line, i|
  word = line.strip
  count = word.chars.each_with_object(Hash.new 0 ) { |e, a| a[e] += 1 }
  entry = Entry.new(word, count)
  list << entry
end

WordList = list
