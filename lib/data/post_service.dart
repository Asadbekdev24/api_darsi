import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:api_darsi/models/post_model.dart';
import 'package:api_darsi/utils/network_constants.dart';
import 'package:api_darsi/utils/typedefs/typedefs.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<Map<String, dynamic>>? getPosts() async {
    final url = Uri.parse(NetworkConstants.FLAVOURS_URL);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return body;
    }
    throw Exception(
        "Postlarni olishda xatolik yuz berdi, iltimos qaytadan urinib ko'ring.\nSizda ayb yo'q bizda ayb.");
  }

  Future<bool> deletePost(String id) async {
    final url = Uri.parse("${NetworkConstants.DELETE_URL}/$id");

    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    }
    throw Exception(
        "Postlarni olishda xatolik yuz berdi, iltimos qaytadan urinib ko'ring.\nSizda ayb yo'q bizda ayb.");
  }


 Future<bool> addPost({
  required String name,
}) async {
  final url = Uri.parse(NetworkConstants.ADD_URL);
  final newPost = {"name": name};

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode(newPost),
  );

  log(response.statusCode.toString());
  log(response.body);

  if (response.statusCode == 201 || response.statusCode == 200) {
    return true;
  }
  return false;
}


  Future<bool> updatePost({
    required String id,
    required String name,
  }) async {
    final url = Uri.parse("${NetworkConstants.FLAVOURS_URL}/$id");
    final flavour = {"name": name};
    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(flavour),
    );

    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
