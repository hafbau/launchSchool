class School
	attr_reader :roster

	def initialize
		@roster = Hash.new{[]}
	end

	def add(name, _grade)
		roster[_grade] += [name]
	end

	def grade(_grade)
		roster[_grade]
	end

	def to_h
		Hash[roster.each { |_grade, students| roster[_grade] = students.sort }.sort]
	end
end
