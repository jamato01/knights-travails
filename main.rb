def get_possible_moves(starting_position, used_moves)
  x = starting_position[0]
  y = starting_position[1]
  possible_moves = [[x + 1, y + 2],
                    [x + 1, y - 2],
                    [x - 1, y + 2],
                    [x - 1, y - 2],
                    [x + 2, y + 1],
                    [x + 2, y - 1],
                    [x - 2, y + 1],
                    [x - 2, y - 1]]
  possible_moves.select do |move|
    !used_moves.include?(move) && move.all? { |value| value.between?(0, 7) }
  end
end

def get_result(ending_position, parent_tracker)
  result = [ending_position]
  position_tracker = ending_position
  until parent_tracker[position_tracker].nil?
    position_tracker = parent_tracker[position_tracker]
    result.unshift(position_tracker)
  end
  result
end

def knights_moves(starting_position, ending_position)
  return ending_position if starting_position == ending_position
  used_moves = []
  positions_queue = [starting_position]
  parent_tracker = {starting_position => nil}

  until positions_queue.empty? || positions_queue.any?(ending_position)
    current_move = positions_queue[0]
    
    possible_moves = get_possible_moves(current_move, used_moves)
    possible_moves.each do |move|
      parent_tracker[move] = current_move
      positions_queue << move
    end
    used_moves << current_move
    positions_queue.shift
  end
  
  get_result(ending_position, parent_tracker)
end

result = knights_moves([0,0],[7,7])
puts "For [0,0] to [7,7], you made it in #{result.length} moves! Here's your path:"
puts "#{result}"