module RailFenceCipher

  def self.encode(msg, rail)
    return msg if rail > msg.length || n == 1
    cycle = self.zigzag_len(rail)
    columns = []
    rows = []

    msg.chars.each_slice(cycle) do |slice|
      columns << slice
    end

    columns.each do |array|
      array.each_with_index do |letter, idx|
        row = (idx / rail * cycle - idx).abs # Should probably put this in a method
        rows[row] = rows[row].to_a << letter
      end
    end
    rows.join
  end

  def self.decode(msg, rail)
    decoded_index = []
    cycle_max = (msg.size - 1) / self.zigzag_len(rail)

    (0..cycle_max).each do |cycle|
      decoded_index[0] = decoded_index[0].to_a + [cycle * self.zigzag_len(rail)]
      base = decoded_index[0][cycle]

      (1...rail).each do |row|
        (decoded_index[row] = decoded_index[row].to_a + [base + row] and break) if row == rail - 1
        zag = base + vth_index(rail, row) if base + vth_index(rail, row) < msg.size
        decoded_index[row] = decoded_index[row].to_a + [base + row, zag]
      end
    end
    mesg = []
    decoded_index.flatten!.compact!.each_with_index { |idx, i| mesg[idx] = msg[i] }
    mesg.join
  end

  private

  def self.zigzag_len(rail)
    2 * rail - 2
  end

  def self.vth_index(rail, start = 0)
    start + self.zigzag_len(rail - start)
  end

end