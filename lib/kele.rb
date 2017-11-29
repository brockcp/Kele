require 'httparty'
require 'json'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    response = Kele.post('/sessions', body: { "email": email, "password": password })

    if response && response["auth_token"]
      @auth_token = response["auth_token"]
      puts "#{email} has logged in"
    else
      puts "login failed"
    end
  end

  def get_me #RETRIEVE CURRENT USER
    response = Kele.get('/users/me', headers: { "authorization" => @auth_token }) #HTTPARTY REQUEST RETURNS RESPONSE OBJECT(DATA) VIA BODY METHOD. PASSING TOKEN VIA HTTPARTYS HEADERS OPTION TO PROPERLY AUTHENTICATE AGAINST BLOC API
    JSON.parse(response.body)  #PARSE METHOD CONVERTS DATA TO RUBY HASH
  end

end
