(define (problem capture-legendary-dogs)
    (:domain pokemon-world)

    (:objects
      ash - player
      raikou entei suicune - legendarypokemon
      victiny keldeo shaymin charizard blastoise venasaur - pokemon
      grassfield0 grassfield1 grassfield2 grassfield3 grassfield4 grassfield5 grassfield6 grassfield7 grassfield8 grassfield9 grassfield10 grassfield11 grassfield12 grassfield13 grassfield14 grassfield15 - location
      item1 item2 item3 - chest
      masterball1 masterball2 masterball3 - masterball
   )

   (:init
        (border grassfield0 grassfield1)
        (border grassfield1 grassfield0)
        (border grassfield0 grassfield4)
        (border grassfield4 grassfield0)
        (border grassfield1 grassfield2)
        (border grassfield2 grassfield1)
        (border grassfield1 grassfield5)
        (border grassfield5 grassfield1)
        (border grassfield2 grassfield3)
        (border grassfield3 grassfield2)
        (border grassfield2 grassfield6)
        (border grassfield6 grassfield2)
        (border grassfield3 grassfield7)
        (border grassfield7 grassfield3)
        (border grassfield4 grassfield5)
        (border grassfield5 grassfield4)
        (border grassfield4 grassfield8)
        (border grassfield8 grassfield4)
        (border grassfield5 grassfield6)
        (border grassfield6 grassfield5)
        (border grassfield5 grassfield9)
        (border grassfield9 grassfield5)
        (border grassfield6 grassfield7)
        (border grassfield7 grassfield6)
        (border grassfield6 grassfield10)
        (border grassfield10 grassfield6)
        (border grassfield7 grassfield11)
        (border grassfield11 grassfield7)
        (border grassfield8 grassfield9)
        (border grassfield9 grassfield8)
        (border grassfield8 grassfield12)
        (border grassfield12 grassfield8)
        (border grassfield9 grassfield10)
        (border grassfield10 grassfield9)
        (border grassfield9 grassfield13)
        (border grassfield13 grassfield9)
        (border grassfield10 grassfield11)
        (border grassfield11 grassfield10)
        (border grassfield10 grassfield14)
        (border grassfield14 grassfield10)
        (border grassfield11 grassfield15)
        (border grassfield15 grassfield11)
        (border grassfield12 grassfield13)
        (border grassfield13 grassfield12)
        (border grassfield13 grassfield14)
        (border grassfield14 grassfield13)
        (border grassfield14 grassfield15)
        (border grassfield15 grassfield14)

        ; Info Ash
        (at ash grassfield12)
        (has-no-masterball ash)
        (has-no-legendary-pokemon ash)
        (defeated-no-guardian ash)

        ; Info pokemons
        (fire-pokemon charizard)
        (at grassfield8 charizard)

        (water-pokemon blastoise)
        (at grassfield9 blastoise)

        (grass-pokemon venasaur)
        (at grassfield13 venasaur)

        ; Info guardians

        (fire-pokemon victiny)
        (at grassfield11 victiny)
        (is-guardian victiny entei)

        (water-pokemon keldeo)
        (at grassfield4 keldeo)
        (is-guardian keldeo suicune)

        (grass-pokemon shaymin)
        (at grassfield7 shaymin)
        (is-guardian shaymin raikou)

        ; Info legendaries
        (at raikou grassfield2)
        (at entei grassfield14)
        (at suicune grassfield0)

        ;(wall grassfield1)
        ;(wall grassfield5)
        ;(wall grassfield6)
        ;(wall grassfield10)

        (at item1 grassfield5)
        (in masterball1 item1)
        (at item2 grassfield6)
        (in masterball2 item2)
        (at item3 grassfield10)
        (in masterball3 item3)
   )

   (:goal (and (defeated-three-guardian) (has-three-legendary-pokemon ash)))
)