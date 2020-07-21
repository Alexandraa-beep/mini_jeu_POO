require 'bundler' #Permet d'executer proprement mon programme depuis app.rb en rendant toutes les gems dispo dans tous les fichiers 
Bundler.require # ""

require_relative 'lib/game' # Fait appel au fichier game.rb dans le dossier lib
require_relative 'lib/player' # Fait appel au fichier player.rb dans le dossier  lib 

class App < Player

player1= Player.new("Josiane") # Fait appel au premier joueur 
player2 = Player.new("José") # Fait appel au second joueur 

puts "Bonjour mesdames messieurs! Et Bienvenue pour un combat de Titans!" # Presentations avec des puts
puts "Tout d'abord, laissez moi vous présenter nos deux combattants : à ma droite #{player1.name}, et ma gauche voici #{player2.name}! "

while player1.life_points > 0 && player2.life_points > 0 do # boucle tandis que le joueur 1 à ... de points de vies supérieur à 0 et le joueur 2 à .. de points de vies supérieur à O alors on fait l'action suivante..
    puts "Voici la forme de chacun de nos joueurs :"
    puts player1.show_state # put qui marque le resultat de l'état du joueur 1
    puts player2.show_state # put qui affiche le resultat de l'état du joueur 2
   
    puts "Passons à la phase d'attaque:" # Phase d'attaque 

    puts player1.attacks(player2)
      break if player2.life_points <= 0 #C'est la fin du jeu si un joueur meurt 
    player2.attacks(player1)
  end
end



