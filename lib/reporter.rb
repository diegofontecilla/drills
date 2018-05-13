require 'net/http'
require 'dotenv'
Dotenv.load

class Reporter
  URL = URI("#{ENV['LEADERBOARD_URI']}/times").freeze

  def post_time(time)
    Net::HTTP.post_form(URL, 'time' => "#{time}")
  end
end