require 'httparty'
require 'json'
require './lib/roadmap'

class Kele
  include HTTParty
  include Roadmap
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

  def get_mentor_availability(mentor_id)
    response = Kele.get("/mentors/#{mentor_id}/student_availability", headers: {"authorization" => @auth_token})
    JSON.parse(response.body)
  end

  def get_messages(page = nil)
    if page == nil
      response = Kele.get("/message_threads", headers: { "authorization" => @auth_token })
    else
      response = Kele.get("/message_threads?page=#{page}", headers: { "authorization" => @auth_token })
    end
    JSON.parse(response.body)
  end

  def create_message(recipient_id, subject, message)
    response = Kele.post("/messages", body: { "recipient_id": recipient_id, "subject": subject, "stripped-text": message }, headers: { "authorization" => @auth_token })
  end

end
