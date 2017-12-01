TO RUN:
$ irb
> require './lib/kele'
>> kele_client = Kele.new("brockpatterson@gmail.com", "Brock4321*")



2.INIT. AUTH. KELECLIENT
$ irb
>> require './lib/kele'
=> true
>> Kele.new("brockpatterson@gmail.com", "Brock4321*")
#INITIALIZE METHOD CREATES NEW KELE CLIENT AUTHORIZED WITH USERNAME AND PASSWORD

3.RETRIEVING CURRENT USER
$ irb
...
>> kele_client = Kele.new("brockpatterson@gmail.com", "Brock4321*")
>> kele_client.get_me

4.MENTOR AVAILABILITY
$ irb
...
>> mentor_id = 2345361
>> kele_client.get_mentor_availability(mentor_id)

5.ROADMAPS & CHECKPOINTS
-roadmaps-
$ irb
...
>> roadmap_id = 37
>> kele_client.get_roadmap(roadmap_id)

-checkpoints-(get id from 'get_roadmap')
$ irb
...
>> checkpoint_id = 99
>> kele_client.get_checkpoint(checkpoint_id)

6.MESSAGING
-retrieving messages-
$ irb
...
>> kele_client.get_messages(1) # returns the first page of message threads
>> kele_client.get_messages # returns all message threads

-creating messages-(2345361 is kinseys id)
$ irb
>> kele_client = Kele.new("brockpatterson@gmail.com", "Brock4321*")
>> kele_client.create_message(2345361, "Test message from brock via kele", "this is a test message")

7.CHECKPOINT SUBMISSION
$ irb
...
checkpoint_id = 2555
enrollment_id = 27909
assignment_branch = "7_checkpoint_submission"
assignment_commit_link =
"https://www.bloc.io/users/brock-patterson/checkpoints/2555?roadmap_section_id=332"
comment = "Whew!!!"
kele_client.create_submission(checkpoint_id, enrollment_id, assignment_branch, assignment_commit_link, comment)


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
