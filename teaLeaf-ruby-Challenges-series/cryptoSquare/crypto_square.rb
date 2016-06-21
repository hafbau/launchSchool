class Crypto

  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.gsub(/[^a-zA-Z0-9]+/, "").downcase
  end

  def size
    sqrt = Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
    # normalize_plaintext.chars.each_slice(size).map(&:join) Also works
  end

  def ciphertext
    cipher_arry.join
  end

  def normalize_ciphertext
    cipher_arry.map(&:join).join(' ')
  end

private
  def cipher_arry
    normalize_plaintext.chars.each_with_index.group_by {|c, i| i % size }
                       .values.map {|e| e.map(&:first)}
  end
end