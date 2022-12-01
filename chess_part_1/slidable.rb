module Slideable
    HORIZONTAL_DIRS = [
        [1, 0],
        [-1,0],
        [0, 1],
        [0,-1]
].freeze

    DIAGONAL_DIRS = [
        [ 1, 1],
        [-1, 1],
        [-1,-1],
        [ 1,-1]
].freeze

def horizontal_dir
    HORIZONTAL_DIRS 
end

def diagonal_dir
    DIAGONAL_DIRS
end

def moves
    all_moves = []
    move_dirs.each do |dir|
        dx, dy = dir
        all_moves.concat(grow_unblocked_moves_in_dir(dx, dy))

    end

    all_moves

end

private
    def moves_dirs
        raise NoImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        curr_x, curr_y = pos
        collect_moves = []
        while true
            next_pos = curr_x + dx, curr_y + dy
            if board.valid_spot?(next_pos)
                collect_moves << next_pos
            # elsif
            #     !board.empty?(next_pos) && !colors_match?(next_pos)
            #     collect_moves << next_pos
            #     break
            else
                break
            end
        end
        return collect_moves
           
          
    end
require "byebug"
    def colors_match?(next_pos)
        debugger
        @color == @board[next_pos].color
    end


end