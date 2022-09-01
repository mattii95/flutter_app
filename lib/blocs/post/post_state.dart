part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadedState extends PostState {
  final PostModel post;

  const PostLoadedState(this.post);

  @override
  List<Object> get props => [post];
}
