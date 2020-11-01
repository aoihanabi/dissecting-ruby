import consumer from "./consumer"


//if (comments.length > 0) {
$(document).on('turbolinks:load', function() {
  var comments;
  comments = $("#comments");

  var global_chat =
  consumer.subscriptions.create({
    channel: "BlogsChannel",
    blog_id: $('#comments').attr('data-blog-id')
  },
  {
    connected() {
      // Called when the subscription is ready for use on the server
      
      console.log("Connected to the room! "/*$("#comments").data('blogId')*/);
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      return comments.append(data['comment']);
    },

    send_comment(comment, blog_id) {
      return this.perform('send_comment', {
        comment: comment,
        blog_id: blog_id
      });
    }
  });

  $('#new_comment').on('submit', function(e) {
    var $this, textarea;
    $this = $(this);
    textarea = $this.find('#comment_content');
  
    if ($.trim(textarea.val()).length > 1) {
      global_chat.send_comment(textarea.val(), $('#comments').attr('data-blog-id'));
      //consumer.send_comment(textarea.val(), comments.data('blog_id'));
      textarea.val('');
    }
    e.preventDefault();
    return false;
  })
}); 
  
//}

