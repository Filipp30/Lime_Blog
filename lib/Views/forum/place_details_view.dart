
import 'package:flutter/material.dart';
import 'package:flutter_forum/Components/comments_component.dart';
import 'package:flutter_forum/Models/comment_model.dart';
import 'package:flutter_forum/Models/place_model.dart';
import 'package:flutter_forum/Providers/comments_provider.dart';
import 'package:provider/provider.dart';

class PlaceDetailsView extends StatefulWidget {
  static const routeName = '/place-details' ;
  @override
  State<PlaceDetailsView> createState() => _PlaceDetailsViewState();
}

class _PlaceDetailsViewState extends State<PlaceDetailsView> {

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as PlaceModel;
    late String newComment;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(data.title.toString()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            elevation: 10,
            child: Column(
              children: [
                Image(
                  image: NetworkImage(data.imageUrl),
                  fit: BoxFit.cover,
                  height: 300,
                ),
                const Divider(height: 10),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title : '+data.title.toString()),
                      const SizedBox(height: 10),
                      Text('Location : '+data.locationName.toString()),
                      const Divider(height: 10, color: Colors.deepOrange,),
                    ],
                  ),
                  subtitle: Text(data.description.toString()),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
                child: CommentsComponent(id: data.id.toString(),)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text('Add comment !'),
                content: TextField(
                  onChanged: (String value){
                    newComment = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      Provider.of<CommentsProvider>(context, listen: false)
                          .addComment(CommentModel(comment: newComment),data.id.toString());
                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
