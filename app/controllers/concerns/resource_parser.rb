require 'rexml/document'
module ResourceParser
extend ActiveSupport::Concern

	include REXML

	private

	def parse xml
		a = Array.new
		doc = Document.new(xml)
		doc.elements.each('sml:SensorML/sml:Observation/swe:DataRecord/swe:field/*') do |ele|
			if ele.get_elements("sml:isTrigger").first.text == 'true'
				a << ele.get_elements("gml:description").first.text
			end
		end
		a
	end
end
