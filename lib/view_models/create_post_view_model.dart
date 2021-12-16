
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/services/http_service.dart';

class CreatePostView extends ChangeNotifier {
  Random random = new Random();
  bool isLoading = false;

  late Post post;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  Future<bool> createPostList() async {
    post = Post(
        title: titleController.text,
        body: bodyController.text,
        userId: random.nextInt(10));
    isLoading = true;
    notifyListeners();

    var response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    isLoading = false;
    notifyListeners();
    print("CreatePost => $response");
    return response != null;
  }
}
