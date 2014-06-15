require 'ap'

class Extractor
	ELEMENTS = %w(:DEADBEEF :fire :water :earth :thunder :light :dark)
	def self.get_units _f
		unit_table = Hash.new

		File.open(_f).each_line do |line|
			next unless line =~ /^MST_UNIT_(\d+)_NAME\^([\w\s]+)\^/
			id = $1.to_i
			name = $2

			element = ELEMENTS[id < 100000 ? id / 10000 : (id - 800000) / 10000]
			rarity = (id % 10 & 0xF) + 1

			unit_table[id] = {
				element: 		element,
				name: 			name,
				rarity: 		rarity,
			}
		end

		return unit_table
	end
end