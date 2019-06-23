class Comment{
  constructor(id,content,userEmail){
    this.id = id;
    this.content = content;
    this.userEmail = userEmail;
  }

  renderListItem()
  {
    return '<li class="comment-panel"><p>'+this.userEmail+'</p><p>'+this.content+'</p></li>';
  }
}
