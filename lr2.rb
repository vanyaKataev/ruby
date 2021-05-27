def work_str()
  puts "Введите  число слово "
 word = gets.chomp
 word = (word.split)[1].upcase
  if word.end_with?('CS')
    puts 2**word.size
  else
    puts word.reverse()
  end
end

def create_poc()
  puts "Введите кол-во"
  rang = gets.to_i
  arr = []
  rang.times do
    test = {}
    puts "Введите имя"
    test["name"] = gets.chomp
    puts "Введите цвет"
    test["color"] = gets.chomp
    arr << test
  end
  puts arr
end

def menu()
  num = gets.to_i
  if num == 1
    work_str
    return
  elsif num == 2
    create_poc
    return
  elsif num == -1
    return
  else
    puts "Неверная команда"
  end
end

menu