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
a = compare()
puts a