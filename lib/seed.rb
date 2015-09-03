
FILENAME = 'file.txt'
LETTERS = %w(a b c d e f g\ \ )


File.open(FILENAME, 'w+') do |f|
  100.times { f.write LETTERS.sample }
  f.close
end
