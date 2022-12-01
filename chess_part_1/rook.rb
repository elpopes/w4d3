require_relative "piece.rb"
require_relative "slidable.rb"

class Rook < Piece
    
    include Slideable
     
    def symbol
        "♖".colorize(color)
    end

    protected

    def move_dirs
        horizontal_dir

    end

end