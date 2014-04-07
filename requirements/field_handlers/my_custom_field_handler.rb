# Copyright 2002-2012 Rally Software Development Corp. All Rights Reserved.

require 'yeti/field_handlers/other_field_handler'
require 'rexml/document'

class MyCustomFieldHandler < OtherFieldHandler
  def initialize(field_name = nil)
    super(field_name)
  end

  # Add code here to transform in the value from Rally to Other
  # ie., the "in" part refers to the fact that the 
  # value of the Rally field is "inbound" to the "Other" system 
  def transform_in(value)

  end

  # Add code here to transform out the value from Other to Rally
  # ie., the "out" part refers to the fact the the 
  # value of the Other field is "outbound" from the "Other" system to Rally
  # Notice that the entire artifact is sent in, so will need 
  # to get the value for the specific field using @field_name
  def transform_out(artifact)
    field_value = @connection.get_value(artifact, @field_name)
    transfomed_value = transformed(field_value)
    return transformed_value
  end

  def transformed(value)
    # your transform may involve prefixing, changing, suffixing, lookup ref  (or any combination)
    xfm_value = "%s%s%s" % [prefix(value), value, suffix(value)]
    return xfm_value
  end

  # Add code here if you have other elements to read from the field handler (besides @field_name)
  def read_config(fmh_element)
    # reads FieldName element from config
    # @field_name holds the FieldName value
    super(fmh_element)

    # Iterate through each field handler element
    #fmh_element.elements.each do |element|
    #  if ( element.name == "MyElementName")
    #    @my_element = get_element_text(element)
    #  end
    #end
  end
end
