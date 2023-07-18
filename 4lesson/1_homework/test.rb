BALANCE = "balance.txt"
Balance = 100.0

class CashMachine
    def first()
        puts "Hello too"
    end

    def second()
        first()
    end

    def self.init
        machine = CashMachine.new
        machine.first()
    end
end

CashMachine.init