class Line
	attr_accessor :classification
	attr_accessor :value
	def initialize
		@classification = classification
		@value = value
	end
end


class Database
	attr_accessor :eliza_statements, :pre, :post, :synon, :decomp
	def initialize(eliza_statements,pre,post,synon,decomp)
		@eliza_statements = eliza_statements
		@pre = pre
		@post = post
		@synon = synon
		@decomp = decomp
	end
end