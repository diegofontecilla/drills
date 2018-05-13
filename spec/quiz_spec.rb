require 'quiz'

RSpec.describe Quiz do
  subject(:quiz) { described_class.new(fake_output, fake_input, fake_reporter) }
  let(:fake_output) { double(puts: nil) }
  let(:fake_input)  { double }
  let(:fake_reporter) { double(post_time: nil) }

  describe '#ask' do
    it 'asks the question and waits for an answer' do
      expect(fake_output).to receive(:puts).with('Who are you?')
      expect(fake_input).to receive_message_chain(:gets, :chomp).and_return('_')

      quiz.ask('Who are you?', '_')
    end

    describe 'checking the answer' do
      it 'moves on if correct' do
        mock_input("Right")
        
        expect(quiz).to receive(:ask).once.and_call_original
        quiz.ask('Who are you?', 'Right')
      end

      it 're-asks forever if incorrect' do
        mock_input("Wrong")

        expect(quiz).to receive(:ask).at_least(2).times.and_call_original
        expect { quiz.ask('Who are you?', '_') }.to raise_error SystemStackError
      end
    end
  end

  describe 'timing the quiz' do
    it 'uses #start and #finish to time the quiz' do
      expect(fake_output).to receive(:puts).with("You completed the drill in: 0.1 seconds.")

      quiz.start
      sleep(0.1)
      quiz.finish
    end

    it 'posts the time using a reporter' do
      expect(fake_reporter).to receive(:post_time).with(0.1)

      quiz.start
      sleep(0.1)
      quiz.finish
    end
  end

  private

  def mock_input(text)
    allow(fake_input).to receive_message_chain(:gets, :chomp).and_return(text)
  end
end