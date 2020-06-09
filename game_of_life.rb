class GameOfLife
    attr_accessor :world,:neighborhood

    def initialize(tamano)
        @world = Array.new(tamano+2){Array.new(tamano+2)} 
        @neighborhood  = Array.new(tamano+2){Array.new(tamano+2)}
    end

    def create_world
        for x in 0..@world.size-1
            for y in 0..@world.size-1
                @world[x][y]=0
                @neighborhood[x][y]=0
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

    def create_universe
        for x in 1..@world.size-2
            for y in 1..@world.size-2
                @world[x][y] = rand(0..1)
            end
        end     
    end 

    def next_step
        for x in 1..@world.size-2      
            for y in 1..@world.size-2
                vecinos=0
                if @world[x-1][y]==1 then 
                    vecinos += 1
                end
                if @world[x-1][y-1]==1 then 
                    vecinos += 1
                end
                if @world[x-1][y+1]==1 then 
                    vecinos += 1
                end
                if @world[x][y-1]==1 then 
                    vecinos += 1
                end
                if @world[x][y+1]==1 then 
                    vecinos += 1
                end
                if @world[x+1][y-1]==1 then 
                    vecinos += 1
                end
                if @world[x+1][y+1]==1 then 
                    vecinos += 1
                end
                if @world[x+1][y]==1 then 
                    vecinos += 1
                end 
               @neighborhood[x][y] = vecinos 
            end   
        end
    end 

    def find_life
        for x in 1..@world.size-2      
            for y in 1..@world.size-2
                if @world[x][y] == 1 then 
                    if(!(@neighborhood[x][y]==2 || @neighborhood[x][y]==3)) then
                        @world[x][y] = 0
                    end
                elsif @neighborhood[x][y]==3 then
                        @world[x][y] = 1 
                end
            end
        end  
    end 
end 

game = GameOfLife.new(20)
game.create_world
game.create_universe
game.print_step
game.next_step
puts "_____________________"
puts "   Neighborhood Matrix   "
game.print_neighborhood
puts "---------------------"
puts " Next generation "
game.find_life
game.print_step