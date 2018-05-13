require_relative './reporter'

class Quiz
  def initialize(output = STDOUT, input = STDIN, reporter = Reporter.new)
    @output   = output
    @input    = input
    @reporter = reporter
  end

  def ask(question, expected)
    @output.puts(question)
    answer = @input.gets.chomp

    ask(question, expected) unless correct?(answer, expected)
  end

  def start
    @start_time = Time.now
  end

  def finish
    total_time = (Time.now - @start_time).round(1)
    @output.puts("You completed the drill in: #{total_time} seconds.")

    @reporter.post_time(total_time)
  end

  private

  def correct?(answer, expected)
    answer == expected
  end
end