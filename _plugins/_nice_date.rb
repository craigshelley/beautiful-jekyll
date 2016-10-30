module TextFilter
  def nice_date(input)
    "BeginMoose#{input}EndMoose"    
  end
end

Liquid::Template.register_filter(TextFilter)
