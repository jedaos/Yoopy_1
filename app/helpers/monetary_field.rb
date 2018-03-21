module MonetaryField

  def monetary_field(objname, method, rate)
  text_field "#{objname}", "#{method}", :rate => ("%0.2f" % rate), :size => 6
  end

end
