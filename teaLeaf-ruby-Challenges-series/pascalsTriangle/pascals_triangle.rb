class Triangle

  def initialize(num_of_rows)
    @num_of_rows = num_of_rows
    @rows = [[1]]
  end

  def rows
    (@num_of_rows - 1).times { @rows << generate} unless @num_of_rows == 1
    @rows
  end

  private

  def generate
    this_row = [] and last_row = @rows.last
    last_row.count.times do |num|
      this_row << ( num == 0 ? 1 : last_row[num] + last_row[num - 1] )
    end
    this_row << 1
  end

end