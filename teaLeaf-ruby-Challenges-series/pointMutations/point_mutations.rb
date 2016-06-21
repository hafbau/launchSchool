class DNA
  def initialize(original_strand)
    @first_strand = original_strand
  end

  def hamming_distance(second_strand)
    @first_strand.chars.zip(second_strand.chars)
                .map { |zipped| zipped.last && zipped.uniq.one? }.count false;
  end
end
