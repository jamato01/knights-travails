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

def knights_moves(starting_position, ending_position, used_moves = [])
  return ending_position if starting_position == ending_position

  possible_moves = get_possible_moves(starting_position, used_moves)
end

puts "possible moves for [1, 1]: #{get_possible_moves([1, 1], [[3,0], [2, 3]])}"