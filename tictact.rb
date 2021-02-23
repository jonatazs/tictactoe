def Game()

    $player1 = { 
        "name" => "",
        "mark" => "",
        "current_player" => false
    }

    $player2 = { 
        "name" => "",
        "mark" => "",
        "current_player" => true
    }

    puts "Welcome to Tic-tac-toe"
    puts "Player 1 - please enter your name"
    $player1["name"] = gets.chomp
    puts "Hi #{$player1["name"]}, would you like to be X or O for today \'s match?"
    $player_selection = gets.chomp.upcase()

        case $player_selection
        when "X"
            $player1["mark"] = "X"
            $player2["mark"] = "O"
        when "O"
            $player1["mark"] = "O"
            $player2["mark"] = "X"
        end

    puts "Very well!... #{$player_selection} it is!"
    sleep(1)
    puts "Player 2 - please enter your name"
    $player2["name"] = gets.chomp

end

class Board
    attr_accessor :num1, :num2, :num3, :num4, :num5, :num6, :num7, :num8, :num9, :line1, :line2, :line3, :break 

    def initialize
    @num1 = 1
    @num2 = 2
    @num3 = 3
    @num4 = 4
    @num5 = 5
    @num6 = 6
    @num7 = 7
    @num8 = 8
    @num9 = 9

      def printBoard()
        puts ""
        puts "  #{@num1}  |  #{@num2}  |  #{@num3} "
        puts "-----+-----+-----"
        puts "  #{@num4}  |  #{@num5}  |  #{@num6} "
        puts "-----+-----+-----"
        puts "  #{@num7}  |  #{@num8}  |  #{@num9} "
        puts ""
      end
    end
end

def startBoard()
    $gameBoard = Board.new()
    $gameBoard.printBoard()
end

def updateBoard()
    $gameBoard.printBoard()
end

def makePlay()
    if $player1[current_player] == true
        current_player = $player1
    else
        current_player = $player2
    end

    def switch_player()
      if $player1["current player"] == true
        $player1["current player"] = false
        $player2["current player"] = true
      else
        $player1["current player"] = true
        $player2["current player"] = false  
      end
    end
    
    def check_occupied(num, current_player)
        if $player1["plays"].include?(num) || $player2["plays"].include?(num)
          puts "that number is taken..." 
          makePlay()
        end
    end  
    
  puts current_player["name"] + " please select a number on the board to make your play..."
  player_choice = gets.chomp
     
  
  # take player entry and update board object
  case player_choice.to_i() 
    when 1
      check_occupied(1, current_player)
      $gameBoard.num1 = current_player["mark"].upcase 
      current_player["plays"].push(1)
    when 2
      check_occupied(2, current_player)
      $gameBoard.num2 = current_player["mark"].upcase 
      current_player["plays"].push(2)
    when 3
      check_occupied(3, current_player)
      $gameBoard.num3 = current_player["mark"].upcase 
      current_player["plays"].push(3)
    when 4
      check_occupied(4, current_player)
      $gameBoard.num4 = current_player["mark"].upcase
      current_player["plays"].push(4)
    when 5
      check_occupied(5, current_player)
      $gameBoard.num5 = current_player["mark"].upcase 
      current_player["plays"].push(5)
    when 6
      check_occupied(6, current_player)
      $gameBoard.num6 = current_player["mark"].upcase
      current_player["plays"].push(6) 
    when 7
      check_occupied(7, current_player)
      $gameBoard.num7 = current_player["mark"].upcase
      current_player["plays"].push(7) 
    when 8
      check_occupied(8, current_player)
      $gameBoard.num8 = current_player["mark"].upcase 
      current_player["plays"].push(8) 
    when 9
      check_occupied(9, current_player)
      $gameBoard.num9 = current_player["mark"].upcase 
      current_player["plays"].push(9)    
  end 

  def check_win() 
    #win variation - 1, 2, 3
    if ($gameBoard.num1 == $gameBoard.num2) && ($gameBoard.num2 == $gameBoard.num3)
      puts "Congratulations, " + $gameBoard.num1 + " is the winner!"
      return true
    end  

    #win variation - 1, 5, 9
    if ($gameBoard.num1 == $gameBoard.num5) && ($gameBoard.num5 == $gameBoard.num9)
      puts "Nice move - " + $gameBoard.num1 + " is the winner!"
      return true
    end  

    #win variation - 1, 4, 7 
    if ($gameBoard.num1 == $gameBoard.num4) && ($gameBoard.num4 == $gameBoard.num7)
      puts "Well done - " + $gameBoard.num1 + " is the winner!"
      return true
    end  

    #win variation - 2, 5, 8
    if ($gameBoard.num2 == $gameBoard.num5) && ($gameBoard.num5 == $gameBoard.num8)
      puts "Congratulations, " + $gameBoard.num2 + " is the winner!"
      return true
    end  

    #win variation - 3, 6, 9
    if ($gameBoard.num3 == $gameBoard.num6) && ($gameBoard.num6 == $gameBoard.num9)
      puts "Nice move - " + $gameBoard.num3 + " is the winner!"
      return true
    end  

    #win variation - 3, 5, 7
    if ($gameBoard.num3 == $gameBoard.num5) && ($gameBoard.num5 == $gameBoard.num7)
      puts "Well done - " + $gameBoard.num3 + " is the winner!"
      return true  
    end  

    #win variation - 4, 5, 6
    if ($gameBoard.num4 == $gameBoard.num5) && ($gameBoard.num5 == $gameBoard.num6)
      puts "Congratulations, " + $gameBoard.num4 + " is the winner!"
      return true
    end  

      #win variation - 7, 8, 9
    if ($gameBoard.num7 == $gameBoard.num8) && ($gameBoard.num8   == $gameBoard.num9)
      puts "Nice move - " + $gameBoard.num7 + " is the winner!"
      return true
    end  

  end 

  #board full - no winner
  def check_deadlock()
    if ($player1["plays"].length() + $player2["plays"].length()) >= 9 && !check_win()
      puts "Its a tie!..."
      return true
    end  
  end  

  player_switch()
  updateBoard()

  if !check_win() && !check_deadlock()
    make_play()
  else
    sleep(2)
    system('clear')
    Game()
    startBoard()
    make_play()
  end    

end

Game()
startBoard()
make_play()

