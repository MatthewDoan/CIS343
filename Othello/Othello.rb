#
# Othello Game Class
# Author(s): Matthew Doan
#

class Othello

  # Constants
  WHITE = 'W'
  BLACK = 'B'
  EMPTY = '-'
  TIE = 'T'

  # Creates getter methods for instance variables @size, @turn, @disc,
  # @p1Disc, and @p2Disc
  attr_reader  :size, :turn, :disc, :p1Disc, :p2Disc

	# Constructs and initializes the board of given size
	def initialize(size, startPlayer, discColor)
		# validate arguments
		if size < 4 || size > 8 || size % 2 != 0
			raise ArgumentError.new('Invalid value for board size.')
		end
		if startPlayer < 1 || startPlayer > 2
			raise ArgumentError.new('Invalid value for player number.')
		end
		if discColor != WHITE && discColor != BLACK
			raise ArgumentError.new('Invalid value for disc.');
		end

		# set instance variables
    @board = []
		@size = size
		@turn = startPlayer
		@disc = discColor

		# set two more instance variables @p1Disc and @p2Disc
		if @turn == 1
			@p1Disc = @disc
			@p2Disc = @disc == WHITE ? BLACK : WHITE
		else
			@p2Disc = @disc
			@p1Disc = @disc == WHITE ? BLACK : WHITE;
		end

		# create the grid (as array of arrays)
		@board = Array.new(@size)
		for i in (0...@board.length)
			@board[i] = Array.new(@size)
			@board[i].fill(0)
		end

		# initialize the grid
		initializeBoard()
	end

  # Initializes the board with start configuration of discs
  def initializeBoard()
    #
    # TO DO: complete this method
    #
    for j in 0...@size
        for i in 0...@size
            @board[j][i]=EMPTY
        end
    end
    center = (@size/2)-1
    @board[center][center] = BLACK
    @board[center+1][center+1] = BLACK
    @board[center+1][center] = WHITE
    @board[center][center+1] = WHITE




  end

  # Returns true if placing the disc of current player at row,col is valid;
  # else returns false
  def isValidMove(row, col)
  	return isValidMoveForDisc(row, col, @disc)
  end

	# Returns true if placing the specified disc at row,col is valid;
  # else returns false
	def isValidMoveForDisc(row, col, disc)
		if @board[row][col] != EMPTY
			return false
		end

    #
    # TO DO: add your code below
    #
        #puts "isValidMoveForDisc entering"
        if (@board[row][col]==EMPTY && (isValidMoveUp(row,col,disc) || isValidMoveDown(row,col,disc) ||isValidMoveLeft(row,col,disc) ||isValidMoveRight(row,col,disc) ||isValidMoveUpRight(row,col,disc) ||isValidMoveUpLeft(row,col,disc) ||isValidMoveDownRight(row,col,disc) ||isValidMoveDownLeft(row,col,disc)))
            return true
        end
        #puts "isValidMoveForDisc exiting"

    # DO NOT DELETE THE LINE BELOW
		return false	# if control reaches this point, then it's not a valid move
    end
    
    def oppColor(disc)
        if (disc == WHITE)
            return BLACK
        end
        if (disc == BLACK)
            return WHITE
        end
        return TIE

    end
    def isValidMoveUp(x,y,disc)
      #puts "isValidMoveUp"
        if(y>1 && @board[x][y-1]== oppColor(disc))
          j = y-2
          while (j>=0)
            if(@board[x][j] == disc)
              return true
            end
            if(@board[x][j]==EMPTY)
              return false
            end
            j -=1
          end
        end
      return false
    end
    
    def isValidMoveUpRight(x,y,disc)
      #puts "isValidMoveUpRight"
      #puts "x: "+x.to_s
      #puts "y: "+y.to_s
        if(x<@size-2 && y <@size-2 && @board[x+1][y+1]==oppColor(disc))
          j=y+2
          i=x+2
          puts "entering loop"
          while i<@size && j<@size
            
            
            if(@board[i][j]==disc)
              return true
            end
            if(@board[i][j]==EMPTY)
              return false
            end
            j+=1
            i+=1
          end
            
        end
        return false
    end
    def isValidMoveRight(x,y,disc)
      #puts "isValidMoveRight"
        if(x<@size-2 && @board[x+1][y] == oppColor(disc))
          i = x+2
          while i<@size
            if(@board[i][y] == disc)
              return true
            end
            if(@board[i][y]==EMPTY)
              return false
            end
            i+=1
          end 
        end
        return false
    end
    def isValidMoveDownRight(x,y,disc)
      #puts "isValidMoveDownUp"
        if(x<@size-2 && y>1 && @board[x+1][y-1]== oppColor(disc))
            j = y-2
            i=x+2
            while i<@size && j>=0
              if(@board[i][j] == disc)
                return true
              end
              if(@board[i][j]==EMPTY)
                return false
              end
              j-=1
            end
          end
          return false
        end
    
    def isValidMoveDown(x,y,disc)
      #puts "isValidMoveDown"
        if(y<@size-2 && @board[x][y+1]==oppColor(disc))
          j=y+2
          while j<@size
            if(@board[x][j]==disc)
              return true
            end
            if(@board[x][j] == EMPTY)
              return false
            end
            j+=1
          end
        end
        return false
    end
    
    def isValidMoveDownLeft(x,y,disc)
      #puts "isValidMoveDownLeft"
        if(x>1 && y>1 && @board[x-1][y-1] == oppColor(disc))
          j = y-2
          i=x-2
          while i>=0 && j>=0
            if(@board[i][j] == disc)
              return true
            end
            if(@board[i][j]==EMPTY)
              return false
            end
          i-=1  
          j-=1
          end
        end
        return false
    end
    
    def isValidMoveUpLeft(x,y,disc)
      #puts "isValidMoveUpLeft"
        if(x>1 && y<@size-2 && @board[x-1][y+1]== oppColor(disc))
          j=y+2
          i=x-2
        while i>=0 && j<@size
          if(@board[i][j]==disc)
            return true
          end
          if(@board[i][j]== EMPTY)
            return false
          end
          i-=1
          j+=1
        end
      end
        return false
    end
    
    def isValidMoveLeft(x,y,disc)
      #puts "isValidMove"
      if(x>1 && @board[x-1][y]==oppColor(disc))
        i=x-2
        while (i>=0)
          if(@board[i][y] ==disc)
            return true
          end
          if(@board[i][y]==EMPTY)
            return false
          end
          i-=1
        end
      end
      return false
    end





























	# Places the disc of current player at row,col and flips the opponent discs as needed
	def placeDiscAt(row, col)
		if (!isValidMove(row, col))
			return
		end

    #
    # TO DO: add your code below
    #
    begin
        @board[row][col] = @disc
        puts "entering the meat of the checkers"
        if (isValidMoveUp(row,col,@disc))
            puts "up"
            j = col-1
            while (@board[row][j]==oppColor(@disc))
                
                @board[row][j]=@disc
                j -= 1
            end
        end
        if (isValidMoveDown(row,col,@disc))
            puts "down"
            j = col+1
            while (@board[row][j]==oppColor(@disc))
                puts j
                @board[row][j]=@disc
                j += 1
                puts "finished iteration"
            end
            puts "ending down"
        end
        if (isValidMoveLeft(row,col,@disc))
            puts "left"
            i = row-1
            puts "entering loop"
            while (@board[i][col]==oppColor(@disc))
                puts i
                @board[i][col]=@disc
                i -= 1
            end
        end
        if (isValidMoveRight(row,col,disc))
            puts "right"
            i = row+1
            
            while (@board[i][col]==oppColor(@disc))
                
                @board[i][col]=@disc
                i += 1
            end
        end
        if (isValidMoveDownRight(row,col,@disc))
            puts "downright"
            i = row+1
            j = col-1
            while (@board[i][j]==oppColor(@disc))
                
                @board[i][j]=@disc
                i += 1
                j -= 1
            end
        end
        if (isValidMoveUpLeft(row,col,@disc))
            puts "upleft"
            i = row-1
            j = col+1
            while (@board[i][j]==oppColor(@disc))
                
                @board[i][j]=@disc
                i -= 1
                j += 1
            end
        end
        if (isValidMoveUpRight(row,col,@disc))
            puts "upright"
            i = row+1
            j = col+1
            while (@board[i][j]==oppColor(@disc))
                
                @board[i][j]=@disc
                i += 1
                j += 1
            end
        end
        if (isValidMoveDownLeft(row,col,@disc))
            puts "downleft"
            i = row-1
            j = col-1
            while (@board[i][j]==oppColor(@disc))
                
                @board[i][j]=@disc
                i -= 1
                j -= 1
            end
        end
    rescue TypeError, NoMethodError
      puts "Type error executed (out of bounds?)"
    end
    # DO NOT DELETE THE CODE BELOW
		if (!isGameOver())
			prepareNextTurn()   # prepare for next turn
    end
    puts "all done"
	end

	# Sets @turn and @disc instance variables for next player
	def prepareNextTurn()
		if @turn == 1
			@turn = 2
		else
			@turn = 1
		end
		if @disc == WHITE
			@disc = BLACK
		else
			@disc = WHITE
		end
	end

	# Returns true if a valid move for current player is available;
  # else returns false
	def isValidMoveAvailable()
		isValidMoveAvailableForDisc(@disc)
  end

	# Returns true if a valid move for the specified disc is available;
  # else returns false
	def isValidMoveAvailableForDisc(disc)
    #
    # TO DO: add your code below
    #
        for i in 0...@size
            for j in 0...@size
                if (isValidMoveForDisc(i,j,disc))
                    return true
                end

            end
        end
        

    # DO NOT DELETE THE LINE BELOW
		return false;
	end

	# Returns true if the board is fully occupied with discs; else returns false
	def isBoardFull()
    #
    # TO DO: add your code below
    #
        for i in 0...@size
            for j in 0...@size
                if (@board[i][j]==EMPTY)
                    return false
                end
            end
        end

    # DO NOT DELETE THE LINE BELOW
		return true;
	end

	# Returns true if either the board is full or a valid move is not available
  # for either disc
	def isGameOver()
		return isBoardFull() ||
					(!isValidMoveAvailableForDisc(WHITE) &&
								!isValidMoveAvailableForDisc(BLACK))
	end

	# If there is a winner, it returns Othello::WHITE or Othello::BLACK.
	# In case of a tie, it returns Othello::TIE
	def checkWinner()
		blackCount = 0
        whiteCount = 0

    #
    # TO DO: add your code below
    #
        for i in 0...@size
            for j in 0...@size
                if (@board[i][j]==WHITE)
                    whiteCount += 1
                end
                if (@board[i][j] == BLACK)
                    blackCount += 1
                end
            end
        end


    # DO NOT DELETE THE CODE BELOW
		if blackCount == whiteCount
			return TIE
		end

		return blackCount > whiteCount ? BLACK : WHITE
	end

	# Returns a string representation of the board
	def to_s()
		str = "\n  "
		for i in (0...@size)
			str << (i+1).to_s + ' '
		end
		str << "\n";
		for i in (0...@size)
			str << (i+1).to_s + ' ';
			str << @board[i].join(' ') + "\n";
		end
		return str;
	end

end
