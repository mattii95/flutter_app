part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostLoadedEvent extends PostEvent {
  @override
  List<Object> get props => [];
}

class FindPostEvent extends PostEvent {
  final int id;

  const FindPostEvent(this.id);

  @override
  List<Object> get props => [id];
}

class AddPostEvent extends PostEvent {
  final PostModel postModel;

  const AddPostEvent(this.postModel);

  @override
  List<Object> get props => [postModel];
}

class UpdatePostEvent extends PostEvent {
  final PostModel postModel;

  const UpdatePostEvent(this.postModel);

  @override
  List<Object> get props => [postModel];
}

class DeletePostEvent extends PostEvent {
  final int id;

  const DeletePostEvent(this.id);

  @override
  List<Object> get props => [id];
}
