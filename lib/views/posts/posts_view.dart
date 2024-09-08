import 'package:flutter/material.dart';
import 'package:mvvm_api/repo/posts/posts_api.dart';
import 'package:mvvm_api/viewmodels/post_view_model.dart';
import 'package:mvvm_api/viewmodels/posts_view_model.dart';

class PostsView extends StatelessWidget {
  PostsView({super.key});
  //dependency injection
  var postsViewModel = PostsViewModel(postsRepo: PostsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: FutureBuilder<List<PostViewModel>>(
            future: postsViewModel.fetchAllPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                var posts = snapshot.data;
                return ListView.builder(
                  itemCount: posts?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(posts?[index].title ?? ""),
                      subtitle: Text(posts?[index].body ?? ""),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
