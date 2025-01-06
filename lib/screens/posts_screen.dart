import 'package:api_darsi/data/post_service.dart';
import 'package:api_darsi/models/post_model.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});

  final postService = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: postService.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text("Postlar yo'q"),
              );
            }
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                final PostModel post = PostModel.fromJson(data[index]);
                return Container(
                  child: Row(
                    children: [
                      Text(post.id.toString()),
                      Text(
                        post.title,
                        maxLines: 2,
                      ),
                    ],
                  ),
                );
              },
            );
            // return Text(snapshot.data.toString());
          }
          // return Center(
          //   child: Text("ERROR"),
          // );

          ),
    );
  }
}
