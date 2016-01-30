class School
	attr_accessor :school

	def initialize
		@school = {}
	end

	def add(name, grade)
		school[grade] ? school[grade] << name : school[grade] = [name]
	end

	def grade(grade)
		school[grade] ? school[grade] : []
	end

	def to_h
		Hash[school.each { |grade, students| school[grade] = students.sort }.sort]
	end
end
