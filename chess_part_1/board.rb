require_relative "piece"
require_relative "null_piece"
require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "pawn"
require_relative "queen"
require_relative "rook"
require "byebug"

class Board
    attr_accessor :all_pieces
    attr_accessor :rows

    def initialize

        @rows = Array.new(8){Array.new(8){NullPiece.new}}
        @all_pieces = {
            rook_1: Rook.new(:blue, self, [0,0]),
            :rook_2 => Rook.new(:blue, self, [0,7]),
            :rook_3 => Rook.new(:red, self, [7,0]),
            :rook_4 => Rook.new(:red, self, [7,7]),
            :knight_1 =>  Knight.new(:blue, self, [0,1]),
            :knight_2 =>  Knight.new(:blue, self, [0,6]),
            :knight_3 => Knight.new(:red, self, [7,1]),
            :knight_4 => Knight.new(:red, self, [7,6]),
            :bishop_1 => Bishop.new(:blue, self, [0,2]),
            :bishop_2 => Bishop.new(:blue, self, [0,5]),
            :bishop_3 => Bishop.new(:red, self, [7,2]),
            :bishop_4 => Bishop.new(:red, self, [7,5]),
            :queen_1 => Queen.new(:blue, self, [0,3]),
            :queen_2 => Queen.new(:red, self, [7,3]),
            :king_1 => King.new(:blue, self, [0,4]),
            :king_2 => King.new(:red, self, [7,4]),
            :pawn_1 => Pawn.new(:blue, self, [1,0]),
            :pawn_2 => Pawn.new(:blue, self, [1,1]),
            :pawn_3 => Pawn.new(:blue, self, [1,2]),
            :pawn_4 => Pawn.new(:blue, self, [1,3]),
            :pawn_5 => Pawn.new(:blue, self, [1,4]),
            :pawn_6 => Pawn.new(:blue, self, [1,5]),
            :pawn_7 => Pawn.new(:blue, self, [1,6]),
            :pawn_8 => Pawn.new(:blue, self, [1,7]),
            :pawn_9 => Pawn.new(:red, self, [6,0]),
            :pawn_10 => Pawn.new(:red, self, [6,1]),
            :pawn_11 => Pawn.new(:red, self, [6,2]),
            :pawn_12 => Pawn.new(:red, self, [6,3]),
            :pawn_13 => Pawn.new(:red, self, [6,4]),
            :pawn_14 => Pawn.new(:red, self, [6,5]),
            :pawn_15 => Pawn.new(:red, self, [6,6]),
            :pawn_16 => Pawn.new(:red, self, [6,7])
    }
        
        place_pieces

    end
    
    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece
    end

    def move_piece(start_pos, end_pos)
        raise "no piece at starting position" if empty?(start_pos)
        raise "must move to valid end position" unless valid_spot?(end_pos)
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        self[end_pos].pos=end_pos
        
    end

    def valid_spot?(pos)
        empty?(pos) && on_board?(pos)
    end

    def empty?(pos)
        self[pos].token == :np
    end

    def on_board?(pos)
        pos.all? {|index| index.between?(0, 8)}
    end


    def place_pieces
        all_pieces.each do |k, v|
            pos = v.pos
            self[pos] = v
        end



        # (0...@rows.length).each do | i|
        #     (0...@rows.length).each do | j|
        #         if i < 2 || i > 5
        #             piece = Piece.new(:black, self, [i,j])
        #             @rows[i][j]=(piece)
        #         else
        #             @rows[i][j]=(NullPiece.new) 
        #         end
        #     end
        # end
        # @rows
    end




end

