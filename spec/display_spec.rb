require './lib/display'

RSpec.describe DisplayBoard do
  let(:array) { [[2, 3, 6], [1, 5, 9]] }
  let(:display) { DisplayBoard.new(array) }

  describe 'test if printboard method returns the right string for display' do
    it 'returns a string based on the array contents' do
      expect(display.print_board(array)).to eql("\n O| X| X\n  | O| X\n  |  | O\n\n")
    end
  end

  describe 'test if clear method empty the display array' do
    it 'returns a cleared array when method called' do
      expect(display.clear_board).to eql(['  ', '  ', '  ', '  ', '  ', '  ', '  ', '  ', '  '])
    end
  end
end
