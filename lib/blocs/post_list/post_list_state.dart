part of 'post_list_bloc.dart';

abstract class PostListState extends Equatable {
  const PostListState();
}

class PostListLoadingState extends PostListState {
  @override
  List<Object> get props => [];
}

class PostListLoadedState extends PostListState {
  final List<PostModel> posts;

  const PostListLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}
