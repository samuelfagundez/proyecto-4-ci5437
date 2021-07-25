var strips = require("strips");

const args = process.argv.slice(2);

// Load the domain and problem.
strips.load(
  args[0] || "./example/domain.pddl",
  args[1] || "./example/problem.pddl",
  function (domain, problem) {
    // Run the problem against the domain, using depth-first-search.

    // Use breadth-first-search.
    // var solutions = strips.solve(domain, problem, false);

    // Use A* search to run the problem against the domain.
    // cost must be a costs function which recieves a state and returns a cost
    // var solutions = strips.solve(domain, problem, cost);

    var solutions = strips.solve(domain, problem);

    // Display each solution.
    for (var i in solutions) {
      var solution = solutions[i];

      console.log("- Solution found in " + solution.steps + " steps!");
      for (var i = 0; i < solution.path.length; i++) {
        console.log(i + 1 + ". " + solution.path[i]);
      }
    }
  }
);
