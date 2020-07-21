require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
                      --------------------------------------------------
                      | Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
                      | Le but du jeu est de ne pas leur la donner !   |
                      --------------------------------------------------  "

puts "Comment t'appelles-tu ?" # Demander le nom de l'utilisateur comme dans les consignes 
nom_du_joueur = gets.chomp.to_s #gets.chomp est utilisé pour prendre les entrées de chaîne des utilisateurs et les stocks dans une variable/to_s: convertie en string: renvoie une représentation sous forme de chaîne d'un objet

adversaires = Array.new #créer un array enemies qui va contenir les deux objets Player que sont José et Josiane. 

playerhuman = HumanPlayer.new(nom_du_joueur) #Fait appel au premier joueur (l'utilisateur)
player1 = Player.new("Josiane") #Fait appel au second joueur Josiane 
adversaires << player1 
player2 = Player.new("José") # Fait appel à l'autre adversaire José
adversaires << player2

while playerhuman.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) 
  puts "L'état de notre joueur #{nom_du_joueur} est de  " # Consigne : demander comment le HumainPlayer va (son état)
  puts  playerhuman.show_state #L'état du joueur 
  puts "Quelle action veux_tu effectuer ?" # Consigne proposer un menu avec les 2 questions
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  

  #la boucle suivante est là pour éviter le cas où un bot est déjà mort et l'utilisateur voudrait l'attaquer

  if player1.life_points > 0 # Si le joueur1 (Josiane) à des points de vie supérieurs à 0 alors...
    print "Taper 0 pour attaquer #{player1.name} " # ..il faut taper 0 pour attaquer Josiane
    print "#{player1.show_state}" # Affiche l'état de Josiane 
    else # Sinon
    puts "#{player1.name} est mort!" # Si les points de vie de Josiane sont inférieurs ou égal à 0 alors Josiane ne peut plus etre combattu 
  end # fin de la boucle if
  
  if player2.life_points > 0 #Meme prince que pour joueur 2 
    print "Tape 1 pour attaquer #{player2.name} " #
    print "#{player2.show_state}" 
    else #
    puts "#{player2.name} est mort!" 
  end # fin de la boucle if
  
  choix = gets.chomp.to_s 

 # Le choix 
  if choix == "a" 
    playerhuman.search_weapon 
  elsif choix == "s" #
    playerhuman.search_health_pack 
  elsif choix == "0" #
    playerhuman.attacks(player1) 
  elsif choix == "1" 
    playerhuman.attacks(player2) 
  end #


  if player1.life_points > 0 || player2.life_points > 0  
    puts "On t'attaque"
    
    adversaires.each do |bot| # anticipe le fait qu'il y aura bientôt 10 ou 20 ou 30 Player : on va pas se taper 10 ou 20 ou 30 lignes de playerX.attacks(user)
      if bot.life_points > 0 #
      bot.attacks(playerhuman) 
    end
  end
  end
end 

puts "La partie est terminée!" 
if playerhuman.life_points <= 0 # Si les points de vie de HumainPlayer est égal ou supérieur à 0 
	 puts "Tu as gagné la partie " # alors tu as gagné 
	else "Tu as perdu la partie" # Sinon tu as perdu ...
  end