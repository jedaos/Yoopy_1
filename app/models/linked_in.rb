# class LinkedIn
#
#   def self.request
#     client = LinkedIn::Client.new(ENV["LINKID"], ENV["LINKSECRET"])
#     request_token = client.request_token({}, :scope => "r_basicprofile r_emailaddress")
#
#     rtoken = request_token.token
#     rsecret = request_token.secret
#   end
# end
