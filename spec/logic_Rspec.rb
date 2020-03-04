require './lib/logic.rb'
RSpec.describe GameLogic do
    describe "#add" do
      it "returns the sum of two numbers" do
        generate_player_moves = Array.new(3){rand 1..9}
        @winning_moves = [[1, 5, 9], [7, 5, 3], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
        GameLogic = GameLogic.new
        expect(GameLogic.checkwin(0)).to eql(7)
      end
    end
  end