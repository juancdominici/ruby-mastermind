module TextInstructions
  def instructions
    <<~HEREDOC


      #{formatting('underline', 'Como jugar Mastermind:')}

      Mastermind es un juego de un jugador contra la computadora.
      Podés elegir ser quien #{formatting('underline', 'crea')} el código o quien #{formatting('underline', 'decifra')} el código.

      Hay 6 tipos diferentes de combinaciones de número / color:

      #{code_colors('1')}#{code_colors('2')}#{code_colors('3')}#{code_colors('4')}#{code_colors('5')}#{code_colors('6')}

      Quien crea el código elige 4 para crear un 'código maestro'. Por ejemplo:

      #{code_colors('1')}#{code_colors('3')}#{code_colors('4')}#{code_colors('1')}

      Como podés ver, puede haber #{formatting('red', 'más de uno')} del mismo número / color.
      Para ganar, quien decifra el codigo necesita adivinar el 'código maestro' en 12 turnos o menos.


      #{formatting('underline', 'Pistas:')}
      Después de cada intento de adivinar, va a haber hasta 4 pistas para ayudar a decifrar el código.

       #{clue_colors('*')}Esto significa que tenes 1 número en la posición correcta.

       #{clue_colors('?')}Esto significa que tenes un número correcto, pero en una posición equivocada.


      #{formatting('underline', 'Ejemplo de pista:')}
      Para continuar con el ejemplo, usando el 'codigo maestro' de arriba, un intento con "1463" produciría 3 pistas:

      #{code_colors('1')}#{code_colors('4')}#{code_colors('6')}#{code_colors('3')}  Pistas: #{clue_colors('*')}#{clue_colors('?')}#{clue_colors('?')}


      El intento tenía 1 número correcto en la posición correcta y 2 números correctos en posiciones incorrectas.

      #{formatting('underline', "¡Es hora de jugar!")}
      ¿Querés CREAR el código o DECIFRAR el código?

      Presiona '1' para CREAR el código #{formatting('underline', '### Aun no implementado! ###')}
      Presiona '2' para DECIFRAR el código
      
    HEREDOC
  end
end