require_relative "piece"

class NullPiece < Piece
    include Singleton

    attr_accessor :token, :empty
    def initialize
            @token = :np
            @empty = true
    end
    
end