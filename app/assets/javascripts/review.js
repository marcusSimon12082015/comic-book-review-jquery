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
}
