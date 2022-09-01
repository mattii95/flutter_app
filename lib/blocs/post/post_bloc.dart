import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_basic_app/crud/models/post_model.dart';
import 'package:flutter_basic_app/crud/resources/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostLoadingState()) {
    on<FindPostEvent>((event, emit) async {
      final post = await postRepository.getPost(event.id);
      emit(PostLoadedState(post));
    });

    on<AddPostEvent>((event, emit) async {
      final post = await postRepository.addPost(event.postModel);
      emit(PostLoadedState(post));
    });

    on<UpdatePostEvent>((event, emit) async {
      final post = await postRepository.updatePost(event.postModel);
      emit(PostLoadedState(post));
    });

    on<DeletePostEvent>((event, emit) async {
      final post = await postRepository.deletePost(event.id);
      emit(PostLoadingState());
    });
  }
}
