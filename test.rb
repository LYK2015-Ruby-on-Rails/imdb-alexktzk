["1","2","3",""].reject(&:empty?).each do |s|
  puts s + "*"
end