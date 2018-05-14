require 'net/http'
require 'dotenv'

Dotenv.load(ENV['ENVIRONMENT'] == 'test' ? '.env.test' : '.env')

class Reporter
  URL = URI("#{ENV['LEADERBOARD_URI']}/times").freeze

  def initialize(output = STDOUT)
    @output = output
  end

  def post_time(time)
    Net::HTTP.post_form(URL, 'time' => "#{time}")

    @output.puts "Your time was posted to the leaderboard! Check it out here: #{ENV['LEADERBOARD_URI']}"
  end
end