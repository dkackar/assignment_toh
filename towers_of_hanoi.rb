class TowersOfHanoi

	def initialize(max)
		arr = Array.new
		max.downto(1) do |weight|
	 	   arr << weight
    	end   

    	@towers = {1=>arr,2=>[],3=>[]}
        puts "# Welcome to Tower of Hanoi!"
		puts "# Instructions:"
		puts "# Enter where you'd like to move from and to"
		puts "# in the format 1,3. Enter 'q' to quit."
	end

	def handle_errors(from,to)
		if from < 1 || from > 3 || to < 0 || to > 3
	   		puts "Tower numbers should be 1 or 2 or 3"
	   		return false
		end

		if @towers[from].size == 0
	   		puts "No more discs to move from Tower #{from}"
	   		return false
 		end

 		if @towers[to].size > 0
 	    	if @towers[from][-1] > @towers[to][-1]
	   	    	puts "Cannot move the bigger disc from #{from} to #{to}"
	   	      	return false
	   		end
 		end

 		return true
	end

	def move_discs(from,to)
		@towers[to] << @towers[from].pop
	end

	def play
		input = ""

		while input != "quit"
			render
			
			puts "Enter your move:"
			input = gets.chomp
			
			if input.downcase == "q"
				break
			end
    
  			from_to = input.split(",")
	
			from = from_to[0].to_i
			to   = from_to[1].to_i
	
			if handle_errors(from,to)
	 			  move_discs(from,to)
			end
		end
    end

    def render
		puts "Tower 1->Discs:#{@towers[1].size},Weight:#{@towers[1][-1]}\
 		2->Discs:#{@towers[2].size},Weight:#{@towers[2][-1]}\
 	    3->Discs:#{@towers[3].size},Weight:#{@towers[3][-1]}"
    end	
end
