class Game
  attr_accessor :human_player, :enemies
  

  def initialize(humain)
    @human_player = HumanPlayer.new(humain) 
    @enemies_in_sight = Array.new
    @players_left = 10
  end

  ... pas eu le temps de finir ...