class TestChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "blogs_#{params['blog_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def send_comment(data)
    puts "---------------------------------"
    puts "#{data['blog_id']} con #{data['blogId']}  "
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end
end
