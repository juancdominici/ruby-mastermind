
module TextContent
  def formatting(description, string)
    {
      'underline' => "\e[4;1m#{string}\e[0m",
      'red' => "\e[31;1m#{string}\e[0m"
    }[description]
  end

  def game_message(message)
    {
      'human_won' => "  ¡Rompiste el código! ¡Felicidades, ganaste! \n\n",
      'display_code' => "Este es el código que intentabas romper:",
      'repeat_prompt' => "\n\n¿Quieres intentarlo otra vez? Presiona 's' para si (cualquier otra tecla para no).",
      'thanks' => formatting('red', formatting('underline', "\n¡Gracias por jugar a Mastermind!"))
    }[message]
  end

  def turn_message(message, number = nil)
    {
      'guess_prompt' => "\nTurno ##{number}: \nIngresa 4 numeros (1-6) para adivinar el código, o '0000' para salir del juego.\n",
    }[message]
  end

  def warning_message(message)
    {
      'answer_error' => formatting('red', "Presiona '1' para CREAR el código\n
      Presiona '2' para DECIFRAR el código\n").to_s,
      'turn_error' => formatting('red', 'Tu intento debe tener 4 digitos entre 1-6.').to_s,
      'last_turn' => formatting('red', 'Elige con cuidado. ¡Esta es tu última oportunidad de ganar!').to_s,
      'code_error' => formatting('red', "Tu 'código maestro' debe tener 4 digitos, usando numeros entre 1 y 6.").to_s,
      'game_over' => "#{formatting('red', 'Fin del juego. ¡Ese código estaba dificil! ¯\\_(ツ)_/¯ ')} \n\n"
    }[message]
  end
end