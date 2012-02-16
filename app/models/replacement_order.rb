class ReplacementOrder < ActiveRecord::Base
	has_many :replacement_pairs

	validates :title, :presence => true

	def add_raplacement_pairs_to_order(pair)
		pair.each do |pair|
			replacement_pairs << pair
		end
	end

end
