import 'package:flutter/material.dart';
import 'package:flutter_forum/Models/comment_model.dart';
import 'package:flutter_forum/Services/data_base_service.dart';

class CommentsProvider with ChangeNotifier {

  List<CommentModel> _comments = [];

  List<CommentModel> get comments {
    return [..._comments];
  }

  Future<void> getComments(String id) async {
    final commentsList = await DataBaseService.getCommentsById(id);
    _comments = commentsList.map((item) => CommentModel(
        comment: item['comment'],
        userId: item['user_id']
    )).toList();
    notifyListeners();
  }

  Future<void> addComment(CommentModel commentModel, String blogPostId) async {
    await DataBaseService.addComment(commentModel, blogPostId);
    _comments.add(commentModel);
    notifyListeners();
  }

}