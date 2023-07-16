STUDENTS_LIST = "students.txt"
RESULTS = "results.txt"
BUFFER = "buffer.txt"


def compare()
    File.foreach(STUDENTS_LIST).with_index do |student, index|
        if File.read(RESULTS).include?(student.chomp)
            @result = "true"
            next
        else
            @result = "false"
            break
        end
    end
    @result
end

def SEARCH(input)
    file = File.open(BUFFER, 'w')
    File.foreach(STUDENTS_LIST).with_index do |student, index|
        if student.include?(input)
            File.open(BUFFER, "a") {|line| line.write "#{student}"}
        end
    end
    file.close
    File.open(RESULTS, "a") {|f| f.write File.read(BUFFER)}
    File.delete(BUFFER) if File.exist?(BUFFER)
end

loop do
    print "Введите необходимый возраст > "
    input = gets.chomp.to_s
    if input == "-1" 
        puts File.read(RESULTS)
        break
    else
        SEARCH(input)
        if compare() == "true"
            puts File.read(RESULTS)
            break
        end
    end
end