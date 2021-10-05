$(function() {
  function buildHTML(comment){
    var html = `<p>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                  ${comment.text}
                </p>`
    return html;
  };
 $('#new-comment').submit(function() {
   e.preventDefault();
   var formData = new FormData(this);
   var url = $(this).attr('action');
   $.ajax({
     url: url,
     type: "POST",
     data: formData,
     dataType: 'json',
     processData: false,
     contentType: false
   })
   .done(function(data){
    var html = buildHTML(data);
    $('.comment-box').append(html);
    $('.comment-text').val('');
    $('.comment-btn').prop('disabled', false);
  })
  .fail(function(){
    alert('error');
  });
 });
});