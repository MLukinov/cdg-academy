ACTOR_LIST_PATH = "artists.txt"
BUFFER = 'buffer.txt'

def CRUD(input)
    
    def READ # Выводим построчно все значения из файла
    File.foreach(ACTOR_LIST_PATH) {|actor| puts actor }
    end

    def SEARCH(id) # Ищем значение в файле по индексу и выводим сообщение о результатах поиска
        File.foreach(ACTOR_LIST_PATH).with_index do |actor, index|
            if id == index
                actor_id = index
                actor = actor.chomp
                puts "В строке номер '#{actor_id}' находится значение '#{actor}'"
            end
        end
    end

    def UPDATE(id, new_value) # Производим изменение строки на основе нужного нам индекса и нового значения
        file = File.open(BUFFER, 'w')
        File.foreach(ACTOR_LIST_PATH).with_index do |actor, index|
           @last_value = actor.chomp if id == index
            file.puts(id == index ? new_value : actor)
        end
        file.close
        File.write(ACTOR_LIST_PATH, File.read(BUFFER))
        File.delete(BUFFER) if File.exist?(BUFFER)
        puts "Значение в строке #{id} изменено с '#{@last_value}' на '#{new_value}'"
    end

    def APPEND(new_actor) # Добавляем нового актера в файл
        File.open(ACTOR_LIST_PATH, "a") {|f| f.write "#{new_actor}\n"}
        puts "Добавлен новый актер #{new_actor}"
    end

    def DELETE(name) # Удаляем строку с актером из файла по имени
        file = File.open(BUFFER, 'w')
        File.foreach(ACTOR_LIST_PATH).with_index do |actor, index|
            actor = actor.chomp
            @actor_deleted = actor if actor == name
            file.puts(actor == name ? next : actor)
        end
        file.close
        File.write(ACTOR_LIST_PATH, File.read(BUFFER))
        File.delete(BUFFER) if File.exist?(BUFFER)
        puts "Значение #{@actor_deleted} удалено"
    end

    def WHERE(pattern) # Ищем значение в файле по паттерну и выводим сообщение о результатах поиска
        File.foreach(ACTOR_LIST_PATH).with_index do |actor, index|
            if actor.include?(pattern)
                actor_id = index
                actor = actor.chomp
                puts "В строке номер '#{actor_id}' находится значение '#{actor}'"
            end
        end
    end

    # настраиваем запуск метода в зависимости от введенной команды в инпуте
    if input == "R"
        puts READ()
    elsif input == "S"
        print "Введите номер строки > "
        id = gets.chomp.to_i
        puts SEARCH(id)
    elsif input == "W"
        print "Введите паттерн для поиска > "
        pattern = gets.chomp.to_s
        puts WHERE(pattern)
    elsif input == "U"
        print "Введите номер строки, которую будем менять > "
        id = gets.chomp.to_i
        print "Введите новое значение строки > "
        new_value = gets.chomp.to_s
        puts UPDATE(id, new_value)
    elsif input == "D"
        print "Введите имя актера, которого хотите удалить > "
        name = gets.chomp.to_s
        puts DELETE(name)
    elsif input == "C"
        print "Введите имя нового актера > "
        new_actor = gets.chomp.to_s
        puts APPEND(new_actor)
    end
end

print "Введите запрос. Используйте команды 'C', 'R', 'U', 'D', 'S', 'W' > "
input = gets.chomp.to_s
puts CRUD(input)