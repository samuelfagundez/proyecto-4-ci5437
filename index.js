var strips = require("strips");
const fs = require("fs");

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
    
    if (!solutions.length)
      return console.log("There is no solution for this problem.");

    // Display each solution.
    for (var i in solutions) {
      var solution = solutions[i];

      fs.writeFile(
        `${args[3] || "Results.txt"}`,
        `- Solution found in ${solution.steps} steps!\n`,
        function (err) {
          if (err) return console.log(err);
        }
      );
      console.log("- Solution found in " + solution.steps + " steps!");

      for (var i = 0; i < solution.path.length; i++) {
        const output = `${i + 1}. ${solution.path[i]}`;
        fs.appendFile(
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
