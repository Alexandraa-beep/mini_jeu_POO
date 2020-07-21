
class Player #class player 
attr_accessor :name, :life_points # attr_accessor: c'est une fonctionnalité qui permet de caractériser plusieurs variables d'instance à la fois (par écris et par lecture)/ name; life_point: variables d'instances 

# Cette boucle def permet d'initialiser un nouveau joueur 

def initialize (name) # initialize: est une méthode de classe (qui se declenche avec .new dans le terminal) qui se declenche automatiquement lorsque que quelque chose d'autre se produit/ name: une des variables d'instances 
	@name = name # 1ère variable de classe @name où ça sera le prenom en question 
	@life_point = 10 # 2nd variable de classe @life_point qui équivaut à 10 points car c'est les points de depart/maximum du jeu 

end

# Cette boucle def permet d'afficher les points de vie 

def show_state # show _state : est une methode de classe pour afficher le nombre de points de vie 
        puts "#{@name} à #{@life_points} de points de vie"  # Puts: affiche la phrase dans le terminal 
    end

# Cette boucle def sert à subir les coups entre les joueurs (baisser le niveau de vie)
    def gets_damage(damage_rest) # gets_damage: c'est une methode de classe qui permet de prendre le nombre de dommages subit avec la variable damage_rest (etant le reste de points de vie)
        @life_points = life_points - damage_rest # on soustrait les points de vie à la variable damage_rest (les coups reçu par l'adversaire)
        if @life_points <= 0 # si les points de vie sont égal à 0 ou infeférieur à 0 alors ...
        puts "le joueur #{name} a été tué !") # on ajoute un puts qui évoque la défaite de ce dernier 
        end # fin de la boucle if 
    end

# Cette boucle def sert à attaquer son adversaire
    def attacks(player) # attacks : est une methode de classe qui va permettre de faire qu'un joueur attaque un autre
        damage_deal = compute_damage #
        player.gets_damage(damage_deal) #
    end
 
 #Cette boucle sert à calculer les dommages que les joueyrs se font subir entre eux    
    def compute_damage 
        return rand(1..6) 
    end
end



