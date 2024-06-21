abstract class PostStates{
  final postsAll;
  PostStates(this.postsAll);
}
class IntitalStatePost extends PostStates{
  IntitalStatePost(super.postsAll);
}


class GetAllPostState extends PostStates{
  GetAllPostState({required postsAll}):super(postsAll);
}


class ErrorToGetPost extends PostStates {
  ErrorToGetPost(super.postsAll);
}

class LoadingToGetPost extends PostStates {
  LoadingToGetPost(super.postsAll);
}
