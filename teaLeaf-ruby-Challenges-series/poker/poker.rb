class Poker

  def initialize(hands)
    @hands = hands.map { |hand| Hand.new(hand) }
  end

  def best_hand
    max_rank = @hands.map { |hand| hand.rank }.max
    best_hands = @hands.select { |hand| hand.rank == max_rank }
    best_hands.map { |bhand| bhand.cards }
  end
end


class Hand
  attr_reader :cards, :rank

  def initialize(cards)
    @cards = cards
    @rank = hand_rank
  end

  private

  def hand_rank
    category_ranking[category].to_s + group_based_rank.join
  end

  def category_ranking
    { 'straight_flush' => 8, 'square' => 7,
      'full' => 6, 'flush' => 5, 'straight' => 4,
      'three' => 3, 'double' => 2, 'pair' => 1,
      'nothing' => 0 }
  end

  def category
    if number_of_suits == 1
      sorted_card_rank_difference.uniq.size == 1 ? 'straight_flush' : 'flush'

    else
      case sorted_face_vals.uniq.size
      when 5
        sorted_card_rank_difference.uniq.size == 1 ? 'straight' : 'nothing'
      when 4
        'pair'
      when 3
        if sorted_face_vals.each_cons(3).any? { |a, b, c| a + b == b + c }
          'three'
        else 'double'; end
      when 2
        if sorted_face_vals[1] + sorted_face_vals[2] == sorted_face_vals[2] + sorted_face_vals[3]
          'square'
        else
          'full'
        end
      end
    end
  end

  def group_based_rank
    sort_hash = sorted_face_vals.group_by { |val| sorted_face_vals.count(val) }
    sort_hash.keys.sort.flat_map { |key| sort_hash[key].sort }.reverse
  end

  def sorted_card_rank_difference
    sorted_face_vals.each_cons(2).map { |fv1, fv2| card_rank(fv2) - card_rank(fv1) }
  end

  def number_of_suits
    cards.map { |card| card[1] }.uniq.length
  end

  def sorted_face_vals
    cards.map { |card| card[0] }
                  .sort_by { |face_value| card_rank(face_value) }.reverse
  end

  def card_rank(face_value)
    { 'K' => 13, 'Q' => 12,
      'J' => 11, 'A' => 1}[face_value] || face_value.to_i
  end

end