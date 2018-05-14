require 'reporter'

RSpec.describe Reporter do
  subject(:reporter) { described_class.new(fake_output) }
  let(:fake_output)  { double(puts: nil) }

  describe '#post_time' do
    it 'posts a time to the leaderboard' do
      url = URI('http://localhost:9292/times')
      expect(Net::HTTP).to receive(:post_form).with(url, 'time' => '0.1')

      reporter.post_time(0.1)
    end

    it 'reminds the user to go see how they did' do
      url = URI('http://localhost:9292/times')
      allow(Net::HTTP).to receive(:post_form)

      expect(fake_output).to receive(:puts).with("Your time was posted to the leaderboard! Check it out here: http://localhost:9292")

      reporter.post_time(0.1)
    end
  end
end