class GameOfLife
  attr_accessor :world, :neighborhood

  def initialize(tamano)
    @world = Array.new(tamano){Array.new(tamano)} 
    @neighborhood  = Array.new(tamano){Array.new(tamano)}
  end

  def create_world
    for x in 0..@world.size-1
      for y in 0..@world.size-1
        @world[x][y] = ['_', '1'].sample
        @neighborhood[x][y] = 0
      end
    end
  end

  def print_step
    @world.each_with_index do |e|
      puts "#{e}" 
    end
  end

  def print_neighborhood
    @neighborhood.each_with_index do |e|
      puts "#{e}" 
    end
  end

  def next_step
    for x in 1..@world.size-2
      for y in 1..@world.size-2
        counter=0
        counter += 1 if @world[x-1][y] == '1'
        counter += 1 if @world[x-1][y-1] == '1'
        counter += 1 if @world[x-1][y+1] == '1'
        counter += 1 if @world[x][y-1] == '1'
        counter += 1 if @world[x][y+1] == '1'
        counter += 1 if @world[x+1][y-1] == '1'
        counter += 1 if @world[x+1][y+1] == '1'
        counter += 1 if @world[x+1][y] == '1'

        @neighborhood[x][y] = counter
      end   
    end
  end 

  def find_life
    for x in 1..@world.size-2      
      for y in 1..@world.size-2
        if(@neighborhood[x][y] == 2 || @neighborhood[x][y] == 3)
          @world[x][y] = '1'
        else
          @world[x][y] = '_' 
        end
      end
    end  
  end 
end 

game = GameOfLife.new(20)
game.create_world
game.print_step
game.next_step
puts "_____________________"
puts "   Neighborhood Matrix   "
game.print_neighborhood
puts "---------------------"
puts " Next generation "
game.find_life
game.print_step