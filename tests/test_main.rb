require_relative '../lib/Extractor.rb'

describe Extractor do 
	ELEMENTS = %w(:fire :water :earth :thunder :light :dark)
	before :all do
		@extracted_data = {
			element: 		Hash.new,
			rarity: 		Hash.new,
		}
		@unit_table = Extractor::get_units '../extracts/sgtext_dictionary_31_5_4.csv'
		@unit_table.each do |id, data|
			@extracted_data[:element][data[:element]] = 1
			@extracted_data[:rarity][data[:rarity]] = 1
		end
	end

	it 'should return non-empty hash' do
		expect(@unit_table.keys.length).to be > 0
	end

	it 'should cover exactly 6 elements' do
		expect(@extracted_data[:element].keys.sort).to be == ELEMENTS.sort
	end

	it 'should have rarities greater than 0' do
		expect(@extracted_data[:rarity].keys.sort).to be == (1..6).to_a
	end
end