require 'rexml/document'
module ResourceParser
  extend ActiveSupport::Concern

  include REXML

  private

  def sensor_parse xml
    a = Hash.new
    doc = Document.new(xml)
    doc.elements.each('sml:SensorML/sml:Observation/swe:DataRecord/swe:field/*') do |ele|
      if ele.get_elements("sml:isTrigger").first.text == 'true'
        a[(ele.attribute :name).to_s] = ele.get_elements("gml:description").first.text
      end
    end
    a
  end

  def actuator_parse xml
    a = Hash.new
    doc = Document.new xml
    doc.elements.each('sml:SensorML/sml:Parameter/swe:DataRecord/swe:field/*') do |ele|
      a[(ele.attribute :name).to_s] = ele.get_elements("gml:description").first.text
    end
    a
  end
end
