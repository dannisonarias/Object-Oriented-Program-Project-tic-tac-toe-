require './lib/logic'

RSpec.describe GameLogic do
    let(:tictac_test) {GameLogic.new}

    describe "#check_win" do
      it "returns 0 index if test is successfull" do
        tictac_test.pmoves[0] = [1,2,0]
        puts "#{tictac_test.pmoves[0]}"
        expect(tictac_test.check_win(0)).to eql(-1)
      end

      it "returns 0 index if test is successfull" do
        tictac_test.pmoves[0] = [1,5,9]
        puts "#{tictac_test.pmoves[0]}"
        expect(tictac_test.check_win(0)).to eql(0)
      end

      it "returns 0 index if test is successfull" do
        tictac_test.pmoves[0] = [1,2,3]
        puts "#{tictac_test.pmoves[0]}"
        expect(tictac_test.check_win(0)).to eql(0)
      end

      it "returns 0 index if test is successfull" do
        tictac_test.pmoves[0] = [1,2,5,3,9]
        puts "#{tictac_test.pmoves[0]}"
        expect(tictac_test.check_win(0)).to eql(0)
      end

      it "returns 0 index if test is successfull" do
        tictac_test.pmoves[0] = [7, 5, 3]
        puts "#{tictac_test.pmoves[0]}"
        expect(tictac_test.check_win(0)).to eql(0)
      end

      it "returns 0 index if test is successfull" do
        tictac_test.pmoves[0] = [4, 5, 6]
        puts "#{tictac_test.pmoves[0]}"
        expect(tictac_test.check_win(0)).to eql(0)
      end

      it "returns 0 index if test is successfull" do
        tictac_test.pmoves[0] = [7,8,9]
        puts "#{tictac_test.pmoves[0]}"
        expect(tictac_test.check_win(0)).to eql(0)
      end

      it "returns 0 index if test is successfull" do
        tictac_test.pmoves[0] = [3,5,7]
        puts "#{tictac_test.pmoves[0]}"
        expect(tictac_test.check_win(0)).to eql(0)
      end

    end

    describe "checking if the game is a draw" do
      it "it returns -2 if all possible moves are taken" do
        tictac_test.pmoves[0] = [1,2,5,3]
        tictac_test.pmoves[1] = [6,4,7,8,9]
        puts "#{tictac_test.pmoves}"
        expect(tictac_test.check_draw).to eql(-2)
      end

      it "it returns -1 if no draw is detected" do
        tictac_test.pmoves[0] = []
        tictac_test.pmoves[1] = [6,4,7,8,9]
        puts "#{tictac_test.pmoves}"
        expect(tictac_test.check_draw).to eql(-1)
      end
    end
    
    describe "Checking if the player selected a valid move" do
      it "returns true if the move is allowed" do
        expect(tictac_test.allowed_move?(9,'danny')).to eql(true)
      end

      it "returns false if the move is not allowed" do
        expect(tictac_test.allowed_move?(rand{10..100},'danny')).to eql(false)
      end

      describe "Checking if the player is not occupied by previous moves" do
        it "returns true if the move is allowed" do
            tictac_test.pmoves[0] = [1,2,9]
          tictac_test.pmoves[1] = [3,5,6]
          expect(tictac_test.not_occupied_move?(8,'danny')).to eql(true)
        end
  
        it "returns false if the move is not allowed" do
            tictac_test.pmoves[0] = [1,2,9]
          tictac_test.pmoves[1] = [3,5,6]
          expect(tictac_test.not_occupied_move?(1,'danny')).to eql(false)
        end
      end
            describe "Checking if the player is not occupied by previous moves" do
        it "returns true if the move is allowed" do
            tictac_test.pmoves[0] = [1,2,9]
          tictac_test.pmoves[1] = [3,5,6]
          expect(tictac_test.not_occupied_move?(8,'danny')).to eql(true)
        end
  
        it "returns false if the move is not allowed" do
            tictac_test.pmoves[0] = [1,2,9]
          tictac_test.pmoves[1] = [3,5,6]
          expect(tictac_test.not_occupied_move?(1,'danny')).to eql(false)
        end
      end

      describe "Checking if the player name is empty" do
        it "returns true if the players name is empty" do
            expect(tictac_test.names_empty?).to eql(true)
        end

        it "returns true if the players name is empty" do
            expect(tictac_test.names_empty?).to eql(true)
        end
        
      end

      describe "checking if right message is given to exit the game" do
        it "returns draw message when @winner = -2" do
          tictac_test.winner = -2
            expect(tictac_test.exit_messages).to eql('Game is a draw')
        end
        it "returns 'exit' message when @winner = -3" do
          tictac_test.winner = -3
            expect(tictac_test.exit_messages).to eql('User Exit')
        end
        it "returns winning message when @winner = 0" do
          tictac_test.players[0]='carlos'
          tictac_test.winner = 0
            expect(tictac_test.exit_messages).to eql('HEY. Congratulations carlos, great match!')
        end
      end
      describe "checking if move is stored" do
        it "returns same move is stored move is success " do
          tictac_test.pinput = 8
            expect(tictac_test.store_move(0)).to eql(8)
        end
        it "returns same move is stored move is success " do
          tictac_test.pinput = 8
            expect(tictac_test.store_move(0)).to eql(8)
        end
      end
    
    end
  end