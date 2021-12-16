
class CommentModel{

  final String ?id;
  final String comment;
  final String ?userId;

  const CommentModel({
    this.id,
    required this.comment,
    this.userId,
  });
}