$(function () {
  var slide_id = 1;

  var $actions_info = $("#actions-template").remove().html(),
      $comment_info = $("#comment-template").remove().html(),
      actions_template = Handlebars.compile($actions_info),
      comment_template = Handlebars.compile($comment_info),
      comments_template = Handlebars.compile($("#comments-template").remove().html()),
      photo_template = Handlebars.compile($("#photo-template").remove().html());

  Handlebars.registerPartial("actions_template", $actions_info);
  Handlebars.registerPartial("comment_template", $comment_info);

  function getAndRenderSlide(id) {
    $.ajax("/photos").done(function (response) {
      if (id > response.length) {
        id = 1;
      } else if (id < 1) {
        id = response.length;
      };

      $("#slideshow").html("").append(photo_template(response[id - 1])).show();    

      $.ajax("/comments?photo_id=" + id).done(function(comments_resp) {
        $("#slide").append(comments_template({comments: comments_resp}));
      });

      slide_id = id;
    });
  };

  function bindEvents() {
    $("#slideshow").on('click', ".next a", function(e) {
      e.preventDefault();
      slide_id += 1;
      getAndRenderSlide(slide_id); 
    });

    $("#slideshow").on('click', ".prev a", function(e) {
      e.preventDefault();
      slide_id -= 1;
      getAndRenderSlide(slide_id); 
    });

    $(".new-comment form").on("submit", function(e) {
      e.preventDefault();
      var comment_input = $(this).serialize() + "&" + $.param({photo_id: slide_id});
      $.ajax({
        url: "/comments/new",
        data: comment_input,
        dataType: "json",
        type: "POST"
      }).done(function(response) {
        $("#view-comments").append(comment_template(response));
      });

      $(this).get(0).reset();
    });

    $("#slideshow").on("click", ".post-actioned a", function(e) {
        e.preventDefault();
        var id = $(this).attr("id"),
            Id = id.charAt(0).toUpperCase() + id.slice(1) + 's'
            url = "/photos/" + id;

        $.ajax({
          url: url,
          data: {
            photo_id: slide_id
          },
          type: "POST",
          dataType: "json"
        }).done(function(response) {
           $(e.target).html(response.total + " " + Id);
        })
    });
  };



  getAndRenderSlide(slide_id);
  bindEvents();
  

});
