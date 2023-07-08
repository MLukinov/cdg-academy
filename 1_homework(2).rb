def foobar (first_number, second_number)
    if first_number == 20 || second_number == 20
        puts second_number
    else
        puts second_number + first_number
    end
end
print "Введите пожалуйста первое число > "
first_number = gets.chomp.to_i
print "Введите пожалуйста второе число > "
second_number = gets.chomp.to_i

puts foobar(first_number, second_number)