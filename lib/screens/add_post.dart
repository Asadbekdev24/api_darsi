// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_darsi/data/post_service.dart';
import 'package:api_darsi/screens/flavours_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {

  final PostService postService;
  const AddPost({
    Key? key,
    required this.postService,
  }) : super(key: key);
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: "So'z kiriting",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async{

            if (textEditingController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Iltimos ta'm nomini kiriting."),
                  ),
                );
                return;
              }
              final res = await widget.postService.addPost(
                name: textEditingController.text.trim(),
              );
              if (res) {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => FlavoursScreen(),));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Xatolik yuz berdi."),
                  ),
                );


              }

          }, child: Text("Add list")),
        ],
      ),
    );
  }
}
