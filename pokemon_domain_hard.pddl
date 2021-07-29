(define (domain pokemon-world)
    (:requirements :strips :typing)
    (:types player location masterball legendarypokemon chest pokemon)

    (:predicates
        (at ?p ?l)(border ?l1 ?l2) (wall ?l) (open ?c)
        (empty ?c) (in ?o ?c)
        (has-no-masterball ?p)
        (has-one-masterball ?p)
        (has-two-masterball ?p - player)
        (has-three-masterball ?p - player)
        (has-no-legendary-pokemon ?p - player)
        (has-one-legendary-pokemon ?p - player)
        (has-two-legendary-pokemon ?p - player)
        (has-three-legendary-pokemon ?p - player)
        (fire-pokemon ?p - pokemon)
        (water-pokemon ?p - pokemon)
        (grass-pokemon ?p - pokemon)
        (is-guardian ?p - pokemon ?lp - legendarypokemon)
        (has-fire-type ?p - player)
        (has-water-type ?p - player)
        (has-grass-type ?p - player)
        (defeated-no-guardian ?p - player)
        (defeated-one-guardian ?p - player)
        (defeated-two-guardian ?p - player)
        (defeated-three-guardian ?p - player)
    )

    (:action move
        :parameters (?p - player ?l1 - location ?l2 - location)
        :precondition (and (at ?p ?l1) (border ?l1 ?l2) (not (wall ?l2)))
        :effect (and (at ?p ?l2) (not (at ?p ?l1)))
    )

    (:action open 
        :parameters (?p - player ?c - chest ?l1 - location)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (not (open ?c)))
        :effect (and (open ?c))
    )

    ; Masterball actions

    (:action collect-first-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?o - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (in ?o ?c) (has-no-masterball ?p) (not (empty ?c)))
        :effect (and (empty ?c) (has-one-masterball ?p) (not (has-no-masterball ?p)))
    )

    (:action collect-second-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?o - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (in ?o ?c) (has-one-masterball ?p) (not (empty ?c))) 
        :effect (and (empty ?c) (has-two-masterball ?p) (not (has-one-masterball ?p)))
    )

    (:action collect-third-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?o - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (in ?o ?c) (has-two-masterball ?p) (not (empty ?c)))
        :effect (and (empty ?c) (has-three-masterball ?p) (not (has-two-masterball ?p)))
    )

    ; Pokemons actions

    (:action catch-fire-pokemon
        :parameters (?p - player ?l1 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l1) (fire-pokemon ?gp) (not (has-fire-type ?p)) (not (is-guardian ?gp ?lp)) )
        :effect (and (has-fire-type ?p) (not (at ?gp ?l1)))
    )

    (:action catch-water-pokemon
        :parameters (?p - player ?l1 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l1) (water-pokemon ?gp) (not (has-water-type ?p)) (not (is-guardian ?gp ?lp)) )
        :effect (and (has-water-type ?p) (not (at ?gp ?l1)))
    )

    (:action catch-grass-pokemon
        :parameters (?p - player ?l1 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l1) (grass-pokemon ?gp) (not (has-grass-type ?p)) (not (is-guardian ?gp ?lp)) )
        :effect (and (has-grass-type ?p) (not (at ?gp ?l1)))
    )

    ; Guardians actions

        ; Fire guardian

    (:action defeat-fire-guardian-first
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-water-type ?p) (defeated-no-guardian ?p) (fire-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-one-guardian ?p) (not (defeated-no-guardian ?p)) (not (at ?gp ?l2)))
    )

    (:action defeat-fire-guardian-second
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-water-type ?p) (defeated-one-guardian ?p) (fire-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-two-guardian ?p) (not (defeated-one-guardian ?p)) (not (at ?gp ?l2)))
    )

    (:action defeat-fire-guardian-third
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-water-type ?p) (defeated-two-guardian ?p) (fire-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-three-guardian ?p) (not (defeated-two-guardian ?p)) (not (at ?gp ?l2)))
    )

        ; Water guardian

    (:action defeat-water-guardian-first
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-grass-type ?p) (defeated-no-guardian ?p) (water-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-one-guardian ?p) (not (defeated-no-guardian ?p)) (not (at ?gp ?l2)))
    )

    (:action defeat-water-guardian-second
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-grass-type ?p) (defeated-one-guardian ?p) (water-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-two-guardian ?p) (not (defeated-one-guardian ?p)) (not (at ?gp ?l2)))
    )

    (:action defeat-water-guardian-third
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-grass-type ?p) (defeated-two-guardian ?p) (water-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-three-guardian ?p) (not (defeated-two-guardian ?p)) (not (at ?gp ?l2)))
    )

        ; Grass guardian

    (:action defeat-grass-guardian-first
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-fire-type ?p) (defeated-no-guardian ?p) (grass-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-one-guardian ?p) (not (defeated-no-guardian ?p)) (not (at ?gp ?l2)))
    )

    (:action defeat-grass-guardian-second
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-fire-type ?p) (defeated-one-guardian ?p) (grass-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-two-guardian ?p) (not (defeated-one-guardian ?p)) (not (at ?gp ?l2)))
    )

    (:action defeat-grass-guardian-third
        :parameters (?p - player ?l1 - location ?l2 - location ?gp - pokemon ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?gp ?l2) (border ?l1 ?l2) (has-fire-type ?p) (defeated-two-guardian ?p) (grass-pokemon ?gp) (is-guardian ?gp ?lp) )
        :effect (and (defeated-three-guardian ?p) (not (defeated-two-guardian ?p)) (not (at ?gp ?l2)))
    )

    ; Legendary actions

    (:action capture-first-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p) (defeated-one-guardian ?p) (has-no-legendary-pokemon ?p))
        :effect (and (has-no-masterball ?p) (has-one-legendary-pokemon ?p) (not (has-one-masterball ?p)) (not (has-no-legendary-pokemon ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-first-legendary-pokemon-having-two-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-two-masterball ?p) (defeated-one-guardian ?p) (has-no-legendary-pokemon ?p))
        :effect (and (has-one-masterball ?p) (has-one-legendary-pokemon ?p) (not (has-two-masterball ?p)) (not (has-no-legendary-pokemon ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-first-legendary-pokemon-having-three-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-three-masterball ?p) (defeated-one-guardian ?p) (has-no-legendary-pokemon ?p))
        :effect (and (has-two-masterball ?p) (has-one-legendary-pokemon ?p) (not (has-three-masterball ?p)) (not (has-no-legendary-pokemon ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-second-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p) (defeated-two-guardian ?p) (has-one-legendary-pokemon ?p))
        :effect (and (has-no-masterball ?p) (has-two-legendary-pokemon ?p) (not (has-one-legendary-pokemon ?p)) (not (has-one-masterball ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-second-legendary-pokemon-having-two-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-two-masterball ?p) (defeated-two-guardian ?p) (has-one-legendary-pokemon ?p))
        :effect (and (has-one-masterball ?p) (has-two-legendary-pokemon ?p) (not (has-one-legendary-pokemon ?p)) (not (has-two-masterball ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-third-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p) (defeated-three-guardian ?p) (has-two-legendary-pokemon ?p))
        :effect (and (has-no-masterball ?p) (has-three-legendary-pokemon ?p) (not (has-two-legendary-pokemon ?p)) (not (has-one-masterball ?p)) (not(at ?lp ?l2)))
    )
)