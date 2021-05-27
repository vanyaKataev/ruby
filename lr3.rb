ef balance
  balance = 100.0
  if File.exist?("balance.txt")

    f = File.open("balance.txt")
    balance = f.read.to_f
    f.close
  end
  loop do

    puts "press B 'Balance'  press D 'Deposit'  press W 'Withdraw  press Q 'Quit'"

    choose = gets.chomp

    case choose.downcase
    when 'd'
      puts 'Введите сумму депозита'
      sum = gets.to_f
      if sum <= 0
        puts 'Значение должно быть больше нуля'
      else
        balance += sum
        puts "Ваш баланс: #{balance}"
        f = File.open('balance.txt', 'w')
        f.write(balance)
      end
    when 'w'
      puts 'Введите сумму для снятия'
      sum = gets.to_f
      if sum <= 0
        puts 'Значение должно быть больше нуля'
      elsif sum > balance
        puts 'Недостаточно средств'
      else
        balance -= sum
        puts "Ваш баланс: #{balance}"
      end
      f = File.open('balance.txt', 'w')
      f.write(balance)
    when 'b'
      puts "Ваш баланс: #{balance}"
    when 'q'
      f = File.open('balance.txt', 'w')
      f.write(balance)
      f.close
      break
    else
      puts 'Некоректно выбран пункт меню'
    end
  end
end

def read
  file = File.open('input.txt')
  students= file.readlines.map { |line|line.chomp }
  file.close
  result = []

  loop do
    puts 'Введите возраст'
    input = gets.to_i
    break if input == -1

    students.each { |student|
      result.append(student) if student.split(' ')[2].to_i == input
    }
    break if students.length == result.length
  end

  file = File.open('result.txt', 'w')
  result.each { |s|
    puts s
    file.write(s + "\n")
  }
  file.close
end

def menu
  loop do
    puts '1. Чтение из файла'
    puts '2. Банковский счёт'
    puts '0. Выход'

    choose = gets.to_i
    case choose
    when 1
      read
    when 2
      balance

    when 0
      break
    else
    end
  end
end

menu