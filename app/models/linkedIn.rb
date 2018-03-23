class LinkedIn


  def request
    client = LinkedIn::Client.new(ENV["linkedInId"], ENV["linkedInSecret"])
    request_token = client.request_token({}, :scope => "r_basicprofile r_emailaddress")

    rtoken = request_token.token
    rsecret = request_token.secret

    
  end
end
