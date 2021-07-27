var strips = require("strips");
strips.verbose = true;

const fs = require("fs");

const args = process.argv.slice(2);

function cost(state) {
  // This is our A* heuristic method to calculate the cost of a state.
  // For Starcraft, the heuristic will be how many required buildings have been built. Subtract x from cost for each correct building, with 0 meaning all required buildings have been made and we're done.
  var cost = 0;

  for (var i in state.actions) {
    var action = state.actions[i].action;

    if (action == "has-three-legendary-pokemon") {
      cost -= 5;
    } else if (action == "has-two-legendary-pokemon") {
      cost -= 5;
    } else if (action == "has-one-legendary-pokemon") {
      cost -= 5;
    }
  }

  return cost;
}

// Load the domain and problem.
strips.load(
  args[0] || "./example/domain.pddl",
  args[1] || "./example/problem.pddl",
  function (domain, problem) {
    // Run the problem against the domain, using depth-first-search.
    // var solutions = strips.solve(domain, problem);

    // Use breadth-first-search.
    // var solutions = strips.solve(domain, problem, false);

    // Use A* search to run the problem against the domain.
    // cost must be a costs function which recieves a state and returns a cost
    var solutions = strips.solve(domain, problem, cost);

    if (!solutions.length)
      return console.log("There is no solution for this problem.");

    // Display each solution.
    for (var i in solutions) {
      var solution = solutions[i];

      fs.writeFileSync(
        `${args[3] || "Results.txt"}`,
        `- Solution found in ${solution.steps} steps!\n`,
        function (err) {
          if (err) return console.log(err);
        }
      );
      console.log("- Solution found in " + solution.steps + " steps!");

      for (var i = 0; i < solution.path.length; i++) {
        const output = `${i + 1}. ${solution.path[i]}`;
        fs.appendFileSync(
          `${args[3] || "Results.txt"}`,
          `${output}\n`,
          function (err) {
            if (err) return console.log(err);
          }
        );
        console.log(output);
      }
    }
  }
);
