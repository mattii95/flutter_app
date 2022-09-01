import 'package:flutter_basic_app/crud/models/post_model.dart';
import 'package:flutter_basic_app/crud/resources/post_provider.dart';

class PostRepository {
  final PostProvider postProvider = PostProvider();

  Future<List<PostModel>> getPosts() async {
    return await postProvider.getPosts();
  }

  Future<PostModel> getPost(int id) async {
    return await postProvider.getPost(id);
  }

  Future<PostModel> addPost(PostModel postModel) async {
    return await postProvider.addPost(postModel);
  }

  Future<PostModel> updatePost(PostModel postModel) async {
    return await postProvider.addPost(postModel);
  }

  Future deletePost(int id) async {
    return await postProvider.deletePost(id);
  }
}
