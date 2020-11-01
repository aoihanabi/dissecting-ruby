import consumer from "./consumer"

$(document).on('turbolinks:load', function() {
  var comments;
  comments = $("#comments");

  if (comments.length > 0) {
    var global_live_comments = consumer.subscriptions.create({
      channel: "BlogsChannel",
      blog_id: $('#comments').attr('data-blog-id')
    },
    {
      connected() {
        console.log("Connected to the room!");
      },
    
      disconnected() {
      },
    
      received(data) {
        return comments.append(data['comment']);
      },

      send_comment(comment, blog_id) {
        return this.perform('send_comment', {
          comment: comment,
          blog_id: blog_id
        });
      }
    });
  }

  $('#new_comment').on('submit', function(e) {
    var $this, textarea;
    $this = $(this);
    textarea = $this.find('#comment_content');
  
    if ($.trim(textarea.val()).length > 1) {
      global_live_comments.send_comment(textarea.val(), $('#comments').attr('data-blog-id'));
      textarea.val('');
    }
    e.preventDefault();
    return false;
  })
});