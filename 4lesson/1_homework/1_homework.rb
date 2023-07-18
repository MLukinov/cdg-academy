BALANCE = "balance.txt"
Balance = 100.0
class CashMachine
    def deposit(balance)
        begin
            print "Введите сумму депозита > "
            input = Float(gets.chomp)
            if input <= 0
                puts "Сумма депозита должна быть больше нуля!"
            else
                new_balance = balance + input
                File.open(BALANCE, "w") {|balance| balance.write "#{new_balance}"}
                puts "Новый баланс - #{new_balance}"
            end
        rescue ArgumentError => error
            puts "Введите число! Ошибка - #{error.message}"
        end
    end

    def withdraw(balance)
        begin
            print "Введите сумму > "
            input = Float(gets.chomp)
            if input > balance
                puts "Нельзя снять больше чем есть на балансе"
            elsif input <= 0
                puts "Сумма снятия должна быть больше нуля!"
            else
                new_balance = balance - input
                File.open(BALANCE, "w") {|balance| balance.write "#{new_balance}"}
                puts "Новый баланс - #{new_balance}"
            end
        rescue ArgumentError => error
            puts "Введите число! Ошибка - #{error.message}"
        end
    end

    def self.init
        machine = CashMachine.new
        loop do
            if File.exist?(BALANCE) #Проверка на заполненность файла происходит через метод .zero
                balance = Float(File.read(BALANCE))
            else
                file = File.new("./balance.txt", "a:UTF-8")
                file.print(Balance)
                file.close
                balance = Float(File.read(BALANCE))
            end
            print "Выберите команду > "
            command = gets.chomp.upcase
        
            if command == "D"
                machine.deposit(balance)
            elsif command == "W"
                machine.withdraw(balance)
            elsif command == "B"
                puts "Ваш баланс #{File.read(BALANCE)} "
            elsif command == "Q"
                puts "Хорошего дня!"
                break
            end
        end
    end
end

CashMachine.init