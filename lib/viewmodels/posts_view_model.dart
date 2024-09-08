import 'package:mvvm_api/models/post_model.dart';
import 'package:mvvm_api/repo/posts/posts_api.dart';
import 'package:mvvm_api/repo/posts/posts_repo.dart';
import 'package:mvvm_api/viewmodels/post_view_model.dart';

class PostsViewModel {
  final String title = "All Posts";
  PostsRepo postsRepo;

  PostsViewModel({
    required this.postsRepo,
  });

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostModel> list = await postsRepo.getAllPosts();
    return list.map((post) => PostViewModel(postModel: post)).toList();
  }
}
