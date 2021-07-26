(define (domain pokemon-world)
    (:requirements :strips :typing)
    (:types player location masterball legendarypokemon chest)

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

    (:action collect-first-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?mb - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (not (empty ?c)))
        :effect (and (empty ?c) (has-one-masterball ?p))
    )

    (:action collect-second-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?mb - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (has-one-masterball ?p) (not (empty ?c))) 
        :effect (and (empty ?c) (not (has-one-masterball ?p)) (has-two-masterball ?p))
    )

    (:action collect-third-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?mb - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (has-two-masterball ?p) (not (empty ?c)))
        :effect (and (empty ?c) (not (has-two-masterball ?p)) (has-three-masterball ?p))
    )

    (:action capture-first-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p))
        :effect (and (not (has-one-masterball ?p)) (has-one-legendary-pokemon ?p) )
    )

    (:action capture-first-legendary-pokemon-having-two-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-two-masterball ?p))
        :effect (and (not (has-two-masterball ?p)) (has-one-masterball ?p) (has-one-legendary-pokemon ?p))
    )

    (:action capture-first-legendary-pokemon-having-three-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-three-masterball ?p))
        :effect (and (not (has-three-masterball ?p)) (has-two-masterball ?p) (has-one-legendary-pokemon ?p))
    )

    (:action capture-second-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p) (has-one-legendary-pokemon ?p))
        :effect (and (not (has-one-legendary-pokemon ?p)) (not (has-one-masterball ?p)) (has-two-legendary-pokemon ?p))
    )

    (:action capture-second-legendary-pokemon-having-two-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-two-masterball ?p) (has-one-legendary-pokemon ?p))
        :effect (and (not (has-one-legendary-pokemon ?p)) (not (has-two-masterball ?p)) (has-one-masterball ?p) (has-two-legendary-pokemon ?p))
    )

    (:action capture-third-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p) (has-two-legendary-pokemon ?p))
        :effect (and (not (has-two-legendary-pokemon ?p)) (not (has-one-masterball ?p)) (has-three-legendary-pokemon ?p))
    )
)