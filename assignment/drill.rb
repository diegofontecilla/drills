# Run this file to start the drill.

require '../lib/quiz'

VARIABLES_AND_ASSIGNMENTS = [
  ["one",      1,  "integer"],
  ["two",      2,  "integer"],
  ["NUMBER_OF_GAMES",    3,  "integer"],
  ["four",     4,  "integer"],
  ["UNLUCKY_NUMBER", 13, "integer"],
  ["fourteen", 14, "integer"],
  ["FIZZBUZZ",  15, "integer"],
  ["average_length", 1.4, "float"],
  ["distance", 12.8, "float"],
  ["amount", 6.50, "float"],
  ["fun", false, "boolean value"],
  ["snakes", true, "boolean value"],
  ["has_eaten_dinner", true, "boolean value"],
  ["IS_RUNNING", false, "boolean value"],
  ["food_type", ":pizza", "symbol"],
  ["application_status", ":success", "symbol"],
  ["validator", ":length", :symbol],
  ["sync_mechanism", ":mutex", :symbol],
  ["spell_type", ":fire", :symbol],
  ["name", "\"David\"", "string"],
  ["error_message", "\"You should use double quotes.\"", "string"],
  ["question", "\"What is your date of birth?\"", "string"],
  ["label", "\"Email address\"", "string"],
  ["answers", "[1, 14, 26]", "array"],
  ["statuses", "[:open, :closed, :abandoned]", "array"],
  ["citizens", "[\"Liz\", \"Timmy\"]", "array"],
  ["game", "{ name: \"Football\", players: 11, fun: false }", "hash"],
  ["arguments", "{ id: 12, action: :delete }", "hash"],
  ["average_scores", "{ year_1: 12.8, year_2: 14.4 }", "hash"],
  ["styles", "{ color: \"blue\", width: 100, height: 200 }", "hash"]
]

quiz = Quiz.new

quiz.ask("Welcome to the Assignment drills. Hit Return to start the drill.", "")

quiz.start

VARIABLES_AND_ASSIGNMENTS.shuffle.each do |variable_and_assignment|
  question = "Assign a variable called '#{variable_and_assignment[0]}' to the #{variable_and_assignment[2]} #{variable_and_assignment[1]}."
  answer = "#{ variable_and_assignment[0] } = #{ variable_and_assignment[1] }"

  quiz.ask(question, answer)
end

quiz.finish
