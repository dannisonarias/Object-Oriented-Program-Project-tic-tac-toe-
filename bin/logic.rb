class GameLogic



    def initialize(player)
        @winning_moves = winning_moves = [[1, 5, 9], [7, 5, 3], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
    end

    def CheckWinner()
    wins = false
    @winning_moves.each do |array|
      wins = true if (array - pmoves[index]).empty?
      winner = index if wins
      winner = -2 if pmoves[0].length + pmoves[1].length == 9
      wins = false
    end

end