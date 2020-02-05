#
#  Game of Life class
#
#  Author(s): Nandigam
#  Authors: Gray Schafer, Matt Doan
#
class GameOfLife

  # Creates getter methods for instance variables @rows and @cols
  attr_reader  :rows, :cols

	# Constructor that initializes instance variables with default values
  def initialize()
    @grid = []
    @rows = 0
    @cols = 0
  end

  # Reads data from the file, instantiates the grid, and loads the
	# grid with data from file. Sets this.grid, this.rows, and
	# this.cols instance variables for later use.
	def loadGrid(file)
		data = IO.read(file)
		tokens = data.strip.split(' ')

		@rows = tokens.shift.to_i
		@cols = tokens.shift.to_i
		@grid = Array(@rows);
		ghost = 0
		for i in 0...@rows do
			@grid[i] = Array.new(@cols)
      @grid[i].fill(0)
    end
		
		#
    # TO DO: setup @grid as array of arrays and fill it with values
    # from the tokens array
    #

		for k in 0...@rows do
			for j in 0...@cols do
				@grid[k][j] = tokens[ghost].to_i
				ghost +=1
			end
    end
			
  end

  # Saves the current grid values to the file specified
	def saveGrid(file)
		data = @rows.to_s + ' ' + @cols.to_s
		for n in (0...@rows) 
			for m in (0...@cols) 
				data += (' ')
				data += (@grid[n][m].to_s)
      end
    end
		data += "\n"
		IO.write(file, data)
	end

	# Mutates the grid to next generation
	def mutate()
		# make a copy of grid and fill it with zeros
		temp = Array.new(@rows)
		for i in (0...@rows)
			temp[i] = Array.new(@cols)
			temp[i].fill(0)
		end

    #
		# TO DO: set values in temp grid to next generation
		#
		for k in 0...@rows
			for h in 0...@cols
				if (@grid[k][h]==1 && getNeighbors(k, h) < 2)
					temp[k][h] = 0
				elsif (@grid[k][h]==1 && getNeighbors(k, h) >3)
					temp[k][h] = 0
				elsif (@grid[k][h]==0 && getNeighbors(k, h) == 3)
					temp[k][h] = 1
				else
					temp[k][h] = @grid[k][h]
				end
			end
		end




    # DO NOT DELETE THE CODE BELOW
		@grid = temp
	end

  # Returns the number of neighbors for cell at @grid[i][j]
	def getNeighbors(i, j)
		neighbors = 0

    #
    # TO DO: determine number of neighbors of cell at @grid[i][j]
		#
		for k in -1..1
			for h in -1..1
				if (!(i==0 && k == -1)&&!(i==@rows-1 && k == 1)&&!(j==0 && h==-1)&&!(j==@cols-1 && h==1))
					neighbors += @grid[i+k][j+h]
				end
			end
		end
		neighbors -= @grid[i][j]




    # DO NOT DELETE THE CODE BELOW
		neighbors
	end

  # Returns a string representation of GameOfLife object
  def to_s
    return "" if @grid.length == 0
    str = "\n"
		for i in 0...@rows
			for j in 0...@cols
				if @grid[i][j] == 0
					str += ' . '
				else
					str += ' X '
				end
			end
			str += "\n"
		end
        str
    end
end



