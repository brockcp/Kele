TO RUN:
1. $ irb
2. > require './lib/kele'    #INITIALIZE CLIENT
3. > xxx = Kele.new("brockxxxx@gmail.com", "Brockxxxxxxx")  #AUTHORIZE CLIENT

>> xxx.get_me  #RETRIEVES CURRENT USER

>> mentor_id = xxxxxxx
>> xxx.get_mentor_availability(mentor_id)

>> roadmap_id = 37
>> xxx.get_roadmap(roadmap_id)

>> checkpoint_id = 99
>> xxx.get_checkpoint(checkpoint_id)

>> xxx.get_messages(1) # returns the first page of message threads
>> xxx.get_messages # returns all message threads
>> xxx.create_message(2345361, "Test message from brock via kele", "this is a test message")  //2345361 is my mentor's id


OPTIONS FOR KELE METHODS
def create_message(recipient_id, subject, message)
  response = Kele.post("/messages", body: { "recipient_id": recipient_id, "subject": subject, "stripped-text": message }, headers: { "authorization" => @auth_token })
  if response["status"] == "submitted"
    puts "Message has been sent"
  else
    puts "Message failed to send"
  end
end

def create_submission(checkpoint_id, enrollment_id, assignment_branch, assignment_commit_link, comment)
  response = Kele.post("/checkpoint_submissions", body: { "checkpoint_id": checkpoint_id, "enrollment_id": enrollment_id, "assignment_branch": assignment_branch, "assignment_commit_link": assignment_commit_link, "comment": comment }, headers: { "authorization" => @auth_token })
  if response["status"] == "submitted"
    puts "Submission has been sent"
  else
    puts "Submission failed to send"
  end
end

NOTES:
After switching to new mac had to 'gem install httparty'
