class Review{
  constructor(id,title,content,userEmail,next,previous)
  {
    this.id = id;
    this.title = title;
    this.content = content;
    this.userEmail = userEmail;
    this.next = next;
    this.previous = previous;
  }

  renderLink()
  {
    $("#reviews-list")
    .append('<li><a href="'+
    window.location.pathname+'/reviews/'+this.id+
    '" class="comic-title-link">'+this.title+' by '+
  this.userName()+'</a></li>');
  }

  userName()
  {
    return this.userEmail.substring(0,this.userEmail.indexOf("@"));
  }

  renderShow()
  {
    $(".row-single .title-user-review").text(this.title+" by "+this.userName());
    $(".container p").text(this.content);
    $("#new_comment").attr("action",this.id+"/comments");
    this.setLinks();
  }

  setComments(array)
  {
    $("#comments-list").empty();
    $.each(array,function(index,value){
      var comment = new Comment(value["id"],value["content"],value["user"]["email"]);
      $("#comments-list").prepend(comment.renderListItem());
    })
  }

  setLinks()
  {
    if (this.next === "") {
      $(".link-show.next-link").hide();
    } else {
      $(".link-show.next-link").attr("href",this.next);
      $(".link-show.next-link").show();
    }

    if (this.previous === "") {
      $(".link-show.previous-link").hide();
    } else {
      $(".link-show.previous-link").attr("href",this.previous);
      $(".link-show.previous-link").show();
    }
  }
}
