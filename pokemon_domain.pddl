(define (domain pokemon-world)
    (:requirements :strips :typing)
    (:types player location masterball legendarypokemon chest)

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

    (:action collect-first-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?o - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (in ?o ?c) (not (empty ?c)) (has-no-masterball ?p))
        :effect (and (empty ?c) (not (has-no-masterball ?p)) (has-one-masterball ?p))
    )

    (:action collect-second-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?o - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (in ?o ?c) (has-one-masterball ?p) (not (empty ?c))) 
        :effect (and (empty ?c) (not (has-one-masterball ?p)) (has-two-masterball ?p))
    )

    (:action collect-third-masterball
        :parameters (?p - player ?c - chest ?l1 - location ?o - masterball)
        :precondition (and (at ?p ?l1) (at ?c ?l1) (open ?c) (in ?o ?c) (has-two-masterball ?p) (not (empty ?c)))
        :effect (and (empty ?c) (not (has-two-masterball ?p)) (has-three-masterball ?p))
    )

    (:action capture-first-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p) (not (has-no-masterball ?p)) (has-no-legendary-pokemon ?p))
        :effect (and (has-no-masterball ?p) (has-one-legendary-pokemon ?p) (not (has-one-masterball ?p)) (not (has-no-legendary-pokemon ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-first-legendary-pokemon-having-two-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-two-masterball ?p) (not (has-no-masterball ?p)) (has-no-legendary-pokemon ?p))
        :effect (and (has-one-masterball ?p) (has-one-legendary-pokemon ?p) (not (has-two-masterball ?p)) (not (has-no-legendary-pokemon ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-first-legendary-pokemon-having-three-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-three-masterball ?p) (not (has-no-masterball ?p)) (has-no-legendary-pokemon ?p))
        :effect (and (has-two-masterball ?p) (has-one-legendary-pokemon ?p) (not (has-three-masterball ?p)) (not (has-no-legendary-pokemon ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-second-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p) (not (has-no-masterball ?p)) (has-one-legendary-pokemon ?p))
        :effect (and (has-no-masterball ?p) (has-two-legendary-pokemon ?p) (not (has-one-legendary-pokemon ?p)) (not (has-one-masterball ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-second-legendary-pokemon-having-two-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-two-masterball ?p) (not (has-one-masterball)) (not (has-no-masterball ?p)) (has-one-legendary-pokemon ?p))
        :effect (and (has-one-masterball ?p) (has-two-legendary-pokemon ?p) (not (has-one-legendary-pokemon ?p)) (not (has-two-masterball ?p)) (not(at ?lp ?l2)))
    )

    (:action capture-third-legendary-pokemon-having-one-masterball
        :parameters (?p - player ?l1 - location ?l2 - location ?lp - legendarypokemon)
        :precondition (and (at ?p ?l1) (at ?lp ?l2) (border ?l1 ?l2) (has-one-masterball ?p) (not (has-no-masterball ?p)) (has-two-legendary-pokemon ?p))
        :effect (and (has-no-masterball ?p) (has-three-legendary-pokemon ?p) (not (has-two-legendary-pokemon ?p)) (not (has-one-masterball ?p)) (not(at ?lp ?l2)))
    )
)