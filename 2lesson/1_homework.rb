def function(word)
    if word.upcase[-2, 2] == "CS" 
       puts "2 в степени #{word.size} = #{2**word.size}"
    else word.reverse
    end
end
    
print "Введите пожалуйста слово > "
word = gets.chomp.to_s
puts function(word)