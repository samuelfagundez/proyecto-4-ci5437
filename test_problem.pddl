(define (problem capture-legendary-dogs)
    (:domain pokemon-world)

    (:objects
      ash - player
      raikou entei suicune - legendarypokemon
      grassfield0 grassfield1 grassfield2 grassfield3 grassfield4 grassfield5 - location
      item1 item2 item3 - chest
      masterball1 masterball2 masterball3 - masterball
   )

   (:init
        (border grassfield0 grassfield1)
        (border grassfield1 grassfield0)
        (border grassfield0 grassfield3)
        (border grassfield3 grassfield0)
        (border grassfield1 grassfield2)
        (border grassfield2 grassfield1)
        (border grassfield1 grassfield4)
        (border grassfield4 grassfield1)
        (border grassfield2 grassfield5)
        (border grassfield5 grassfield2)
        (border grassfield3 grassfield4)
        (border grassfield4 grassfield3)
        (border grassfield4 grassfield5)
        (border grassfield5 grassfield4)

        (at ash grassfield0)

        (at item1 grassfield2)


   )

   (:goal (and (has-one-masterball ash)))
)