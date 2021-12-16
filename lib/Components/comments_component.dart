import 'package:flutter/material.dart';
import 'package:flutter_forum/Providers/comments_provider.dart';
import 'package:provider/provider.dart';

class CommentsComponent extends StatelessWidget {

  final String id;
  CommentsComponent({required this.id});

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: Provider.of<CommentsProvider>(context, listen: false).getComments(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child:Text(snapshot.error.toString()));
        } else {
          return Consumer<CommentsProvider>(
            child: const Center(child: Text('Got no comments yet, adding some comment !')),
            builder: (ctx, CommentsProvider, child) => CommentsProvider.comments.isEmpty ? child! :
            ListView.builder(
              padding: EdgeInsets.only(top: 15,bottom: 15),
              itemCount: CommentsProvider.comments.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: Text('user id:'+CommentsProvider.comments[index].id.toString()),
                    subtitle: Text(CommentsProvider.comments[index].comment.toString()),
                    dense: true,
                  ),
                );
              },
            ),
          );
        }
      },

    );
  }
}

