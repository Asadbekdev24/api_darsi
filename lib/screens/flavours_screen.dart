import 'dart:developer';

import 'package:api_darsi/data/post_service.dart';
import 'package:api_darsi/models/flavours_model.dart';
import 'package:api_darsi/models/post_model.dart';
import 'package:flutter/material.dart';

class FlavoursScreen extends StatefulWidget {
  FlavoursScreen({super.key});

  @override
  State<FlavoursScreen> createState() => _FlavoursScreenState();
}

class _FlavoursScreenState extends State<FlavoursScreen> {
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

            final data = snapshot.data;
            final FlavourModel flavours = FlavourModel.fromJson(data!);
            if (flavours.data!.isEmpty) {
              return Center(
                child: Text("Postlar yo'q"),
              );
            }
            return ListView.builder(
              itemCount: flavours.data!.length,
              itemBuilder: (context, index) {
                // log(data.toString());
                log(flavours.data.toString());
                final FlavourData flavourData = flavours.data![index];
                return GestureDetector(
                  onTap: () async {
                    await postService.deletePost(flavourData.id.toString());
                    setState(() {});
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(flavourData.id.toString()),
                            Text(
                              flavourData.name.toString(),
                              maxLines: 2,
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
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
