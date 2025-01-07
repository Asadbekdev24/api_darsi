// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_darsi/data/post_service.dart';
import 'package:flutter/material.dart';

class AddFlavourScreen extends StatefulWidget {
  final String flavourId;
  final String actualName;
  final PostService postService;
  const AddFlavourScreen({
    super.key,
    required this.flavourId,
    required this.postService,
    required this.actualName,
  });

  @override
  State<AddFlavourScreen> createState() => _AddFlavourScreenState();
}

class _AddFlavourScreenState extends State<AddFlavourScreen> {
  final TextEditingController flavourController = TextEditingController();
  @override
  void initState() {
    super.initState();
    flavourController.text = widget.actualName;
  }

  @override
  void dispose() {
    super.dispose();
    flavourController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update flavour"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: flavourController,
          ),
          ElevatedButton(
            onPressed: () async {
              if (flavourController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Iltimos ta'm nomini kiriting."),
                  ),
                );
                return;
              }
              final res = await widget.postService.updatePost(
                id: widget.flavourId,
                name: flavourController.text.trim(),
              );
              if (res) {
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Xatolik yuz berdi."),
                  ),
                );
              }
            },
            child: Text(
              "Update",
            ),
          ),
        ],
      ),
    );
  }
}
