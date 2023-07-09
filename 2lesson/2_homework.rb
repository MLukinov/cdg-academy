def pockemons_main(count)
pockemon_numbers = [1]
    loop do # Собираем порядковые числа покемонов исходя из их кол-ва
        number = pockemon_numbers[-1]
        break if number == count
        pockemon_numbers.push (number + 1)
    end
    pockemons_list = []
    for number in pockemon_numbers # Собираем информацию по каждому покемону и вносим их в список
        print "Введите имя покемона #{number} > " 
        name = gets.chomp.to_s
        print "Введите цвет покемона #{number} > "
        color = gets.chomp.to_s
        pockemon = {name: name, color: color}
        pockemons_list.push(pockemon)
    end
puts "Список покемонов: #{pockemons_list}"
end    


print "Сколько покемонов Вы хотите добавить ? "
count = gets.chomp.to_i
puts pockemons_main(count)


# из улучшений: 
# Можно добавить фильтрацию ввода числа и цвета покемонов (чтобы нельзя было вводить некорректные данные)
# Можно сделать итоговый вывод покемонов более красиво
# Возможно есть пути упрощения кода