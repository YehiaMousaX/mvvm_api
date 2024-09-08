import 'package:mvvm_api/models/post_model.dart';

abstract class PostsRepo
{
  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getPostByid(int id);
}