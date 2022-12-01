require "colorize"
class Piece
    attr_accessor :token, :pos, :empty, :board
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @token = :p
        @empty = false
    end

    def moves

    end

    def position

    end

    def empty?
        @empty
    end

        
end