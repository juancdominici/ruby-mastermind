require './text_content'
require './text_instructions'
require './display'

class Game
  include TextInstructions
  include TextContent
  include Display

  @@guessed = false
  @@playoption = true
  @@playeroption = true
  @@counter = 1
  @@alone = 1

  def play
    puts instructions
    @@guessed = false
  @@playoption = true
  @@playeroption = true
  @@counter = 1
  @@alone = 1

    while @@playoption
      gamemode = gets.chomp.to_i
      if gamemode == 1
        @@playoption = false
        master_algorithm
      elsif gamemode == 2
        @@playoption = false
        puts "\nPresione '1' para un jugador\nPresione '2' para dos jugadores\n\n"
        while @@playeroption
          @@alone = gets.chomp.to_i
          if @@alone == 1
            @@playeroption = false
            master_algorithm(true)
          elsif @@alone == 2
            @@playeroption = false
            master_algorithm(false)
          else
            puts 'Por favor intente nuevamente.'
            next
          end
        end
      else
        puts 'Por favor intente nuevamente.'
      end
    end
  end

  def master_algorithm(premadecode)
    # Premade validation
    if premadecode
      code = [rand(1...6), rand(1...6), rand(1...6), rand(1...6)]
    else
      puts "\nPor favor ingrese el código:"
      code = gets.chomp.split(//)
    end

    while code.length > 4 || code.length < 4 || code.any? { |val| val.to_i > 6 }
      puts warning_message('code_error')
      code = gets.chomp.split(//)
      next
    end

    puts `clear`
    puts formatting('underline', '¸„.-•~¹°”ˆ˜¨ мaѕтerмιnd ¨˜ˆ”°¹~•-.„¸')
    puts "\n"

    guess = []

    # 12 turns
    until @@guessed == true || @@counter > 12
      puts turn_message('guess_prompt', @@counter)
      guess = gets.chomp.split(//)
      while guess.length > 4 || guess.length < 4 || guess.any? { |val| val.to_i > 6 }
        puts warning_message('turn_error')
        guess = gets.chomp.split(//)
        next
      end

      break if guess == %w[0 0 0 0]

      correctPos = []
      correctNum = []
      p = []

      guess.each_with_index do |x, index|
        if code[index] == x
          correctPos.push('●')
          p.push(index)
        elsif code.include? x
          correctNum.push('○')
          p.push(index)
        end
      end

      guesstally = Hash.new(0)
      guess.each { |n| guesstally[n] += 1 }

      # #Checks for repeats
      if guesstally.length < 4
        counter = guesstally.length
        counter.times do
          correctNum.shift
        end
      end

      human_win_condition(correctPos)
      break if @@guessed
      

      if @@counter > 12
        puts warning_message(game_over)
        repeat
        break
      elsif @@counter > 11
        puts warning_message('last_turn')
      end
      @@counter += 1

      formatted_guess = "\n#{code_colors(guess[0])} #{code_colors(guess[1])} #{code_colors(guess[2])} #{code_colors(guess[3])}"

      puts "#{formatted_guess} - Pistas: #{formatting('red', correctPos * ' ')} #{correctNum * ' '}\n"
    end
    repeat
  end

  def human_win_condition(pos)
    if pos.length == 4
      @@guessed = true
      puts game_message('human_won')
      turncount = if @@counter == 1
                    'turno'
                  else
                    'turnos'
                  end
      puts "    ¡Ganaste en #{formatting('red', "#{@@counter}")} #{turncount}!"

      if @@counter > 10
        (puts '    Estuviste muy cerca, el código debe haber sido complicado')
      else
        if @@counter > 6
          (puts '    Felicidades, casi tan veloz como la computadora')
        else
          @@counter > 3 ? (puts '    Acaso es esta, ¿la mente más veloz del condado?') : (puts '    ¿Esta partida estaba arreglada, no?')
        end
      end
    end
  end

  def repeat
    puts "    #{game_message('repeat_prompt')}"
      replay = gets.chomp
      puts game_message('thanks') if replay.downcase != 's'
      Game.new.play if replay.downcase == 's'
  end
end
