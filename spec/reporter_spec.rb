require 'reporter'

RSpec.describe Reporter do
  subject(:reporter) { described_class.new }

  describe '#post_time' do
    it 'posts a time to the leaderboard' do
      url = URI('http://localhost:9292/times')
      expect(Net::HTTP).to receive(:post_form).with(url, 'time' => '0.1')

      reporter.post_time(0.1)
    end
  end
end