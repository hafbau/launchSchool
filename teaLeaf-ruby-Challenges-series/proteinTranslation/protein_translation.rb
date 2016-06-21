module ProteinErrors
  class InvalidCodonError < StandardError; end
end

class Translation
  include ProteinErrors

  ENCODER = { 'Methionine' => ['AUG'], 'Phenylalanine' => ['UUU', 'UUC'],
              'Leucine' => ['UUA', 'UUG'], 'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
              'Tyrosine' => ['UAU', 'UAC'], 'Cysteine' => ['UGU', 'UGC'],
              'Tryptophan' => ['UGG'], 'STOP' => ['UAA', 'UAG', 'UGA']
            }

  def self.of_codon(codon)
    ENCODER.select { |_, codons| codons.include? codon }.keys[0]
  end

  def self.of_rna(rna)
    proteins = []
    codons = rna.scan(/.{3}/)
    codons.each do |codon|
      protein = Translation.of_codon(codon)
      raise InvalidCodonError unless protein
      break if protein == 'STOP'
      proteins << protein
    end
    proteins
  end
end