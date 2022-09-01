import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_basic_app/crud/models/post_model.dart';
import 'package:flutter_basic_app/crud/resources/post_repository.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final PostRepository postRepository;
  PostListBloc(this.postRepository) : super(PostListLoadingState()) {
    on<PostListLoadedEvent>((event, emit) async {
      final posts = await postRepository.getPosts();
      emit(PostListLoadedState(posts));
    });
  }
}
