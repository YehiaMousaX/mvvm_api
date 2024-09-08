import 'package:dio/dio.dart';
import 'package:mvvm_api/models/post_model.dart';
import 'package:mvvm_api/repo/posts/posts_repo.dart';

class PostsApi extends PostsRepo {
  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> posts = [];
    try {
      // fetch all posts
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      var list = response.data as List;
      posts = list.map((post) => PostModel.fromJson(post)).toList();
    } catch (e) {
      print(e);
    }
    print(posts);
    return posts;
  }

  @override
  Future<PostModel> getPostByid(int id) {
    // TODO: implement getPostByid
    throw UnimplementedError();
  }
}
