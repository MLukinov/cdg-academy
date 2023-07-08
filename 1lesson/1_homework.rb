def greeting(first_name, last_name, age)
    age<18 ? "Привет #{first_name} #{last_name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано" : 
    "Привет #{first_name} #{last_name}. Самое время заняться делом!"
end 

print "Enter your age > "
age = gets.chomp.to_i
print "Enter your First Name > "
first_name = gets.chomp.to_s
print "Enter your Last Name > "
last_name = gets.chomp.to_s
puts greeting(first_name, last_name, age)
