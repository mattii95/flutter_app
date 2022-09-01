part of 'post_list_bloc.dart';

abstract class PostListEvent extends Equatable {
  const PostListEvent();
}

class PostListLoadedEvent extends PostListEvent {
  @override
  List<Object> get props => [];
}
