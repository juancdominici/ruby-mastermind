# ruby-mastermind
Mastermind game made in Ruby, testing OOP principles for the first time. Game text is in Spanish.

In the project directory, you can run:

### `ruby main.rb`

Runs the game in terminal.<br />

### Como jugar Mastermind:

Mastermind es un juego de un jugador contra la computadora.
Podés elegir ser quien crea el código o quien decifra el código.

Hay 6 tipos diferentes de combinaciones de números:

  1     2     3     4     5     6   

Quien crea el código elige 4 para crear un 'código maestro'. Por ejemplo:

  1     3     4     1   

Como podés ver, puede haber más de uno del mismo números.
Para ganar, quien decifra el codigo necesita adivinar el 'código maestro' en 12 turnos o menos.


## Pistas:
Después de cada intento de adivinar, va a haber hasta 4 pistas para ayudar a decifrar el código.

 ● Esto significa que tenes 1 número en la posición correcta.

 ○ Esto significa que tenes un número correcto, pero en una posición equivocada.


## Ejemplo de pista:
Para continuar con el ejemplo, usando el 'codigo maestro' de arriba, un intento con "1463" produciría 3 pistas:

  1     4     6     3     Pistas: ● ○ ○ 


El intento tenía 1 número correcto en la posición correcta y 2 números correctos en posiciones incorrectas.
