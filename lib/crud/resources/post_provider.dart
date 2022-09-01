import 'dart:convert';

import 'package:flutter_basic_app/crud/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostProvider {
  final String authority = 'jsonplaceholder.typicode.com';
  final client = http.Client();

  Future<List<PostModel>> getPosts() async {
    const String unencodedPath = '/posts';

    final Uri uri = Uri.https(authority, unencodedPath);
    final response = await client.get(uri);
    final json = jsonDecode(response.body) as List;

    List<PostModel> posts = json.map((e) => PostModel.fromMap(e)).toList();

    return posts;
  }

  Future<PostModel> getPost(int id) async {
    final String unencodedPath = '/posts/$id';

    final Uri uri = Uri.https(authority, unencodedPath);
    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PostModel.fromMap(json);
  }

  Future<PostModel> addPost(PostModel postModel) async {
    const String unencodedPath = '/posts';

    final Uri uri = Uri.https(authority, unencodedPath);
    final Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    final body = {
      'title': postModel.title,
      'body': postModel.body,
      'userId': 1,
    };

    final response =
        await client.post(uri, headers: headers, body: jsonEncode(body));
    final json = jsonDecode(response.body);

    return PostModel.fromMap(json);
  }

  Future<PostModel> updatePost(PostModel postModel) async {
    final String unencodedPath = '/posts/${postModel.id}';

    final Uri uri = Uri.https(authority, unencodedPath);
    final Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    final body = {
      'title': postModel.title,
      'body': postModel.body,
      'userId': 1,
    };

    final response =
        await client.put(uri, headers: headers, body: jsonEncode(body));
    final json = jsonDecode(response.body);

    return PostModel.fromMap(json);
  }

  Future deletePost(int id) async {
    final String unencodedPath = '/posts/$id';

    final Uri uri = Uri.https(authority, unencodedPath);

    final response = await client.delete(uri);

    print(response.body);
  }
}
