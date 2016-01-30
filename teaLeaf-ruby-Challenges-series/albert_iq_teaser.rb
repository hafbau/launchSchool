class AlbertHouses
  attr_accessor :owner, :color, :owner_drink, :owner_cigar, :pets, :neighbors, :order

  def initialiaze(owner, col='', drink='', cig='', pets = '', ord = '', neigh = '')
    @owner = owner
    @color = col
    @owner_drink = drink
    @owner_cigar = cig
    @pets = pets
    @order = ord
    @neighbors = [neigh]
  end

  def to_s
    "House no.: #{order} Owner: #{owner}, Color: #{color}, Drinks: #{owner_drink},
     Smokes: #{owner_cigar} and Pets: #{pets} with Neighbors: #{neighbors}"
  end
end

brit = AlbertHouses.new 'British'
swed = AlbertHouses.new 'Swede'
dani = AlbertHouses.new 'Danish'
norw = AlbertHouses.new 'Norwegian'
germ = AlbertHouses.new 'German'