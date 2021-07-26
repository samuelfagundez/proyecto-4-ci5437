# proyecto-4-ci5437

### How to run

1. npm install
2. npm start  `<domain file>` `<problem file>`

### Description

Ash wants to capture 3 legendary pokemons, for that, he will have to pick up the necessary master balls which are spread for all the world, in order to face the desired pokemons.

![](https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/243.png)
![](https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/244.png)
![](https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/245.png)

### Reserved words for creating a world using the pokemon-world domain

#### Check out the examples if you need ideas to use it.

- `?a - player`: Defines **a** as a **player**.
- `?a - location`: Defines **a** as a **location**.
- `?a - masterball`: Defines **a** as a **masterball**.
- `?a - legendarypokemon`: Defines **a** as a **legendary pokemon**.
- `?a - chest`: Defines **a** as a **chest**.
- `in ?a ?b`: Indicates that **a** is inside **b** (used for **objects** and **chests**).
- `border ?a ?b`: Indicates that **a** is adjacent to **b** (used for **location**, **NOTE**: if **a** is **b** border it doesn't imply that **b** is **a** border, must be defined twice in case you want a mutual relation).
- `wall ?a`: Indicates that **a** is out of the fields that be walked in (used for **location**).
- `at ?a ?b`: Indicates that **a** is in **b** (used to place **entities** in a **field**).
