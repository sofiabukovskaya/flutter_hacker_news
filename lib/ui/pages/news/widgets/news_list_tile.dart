import 'package:flutter/material.dart';
import 'package:flutter_news/data/models/item_model.dart';
import 'package:flutter_news/ui/blocs/stories_bloc/stories_provider.dart';
import 'package:flutter_news/ui/pages/news/widgets/loading_container.dart';


class NewsListTile extends StatelessWidget {
  final int itemId;
  NewsListTile({this.itemId});
  @override
  Widget build(BuildContext context) {
   final bloc = StoriesProvider.of(context);

   return StreamBuilder(
     stream: bloc.items,
     builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
       if(!snapshot.hasData) {
         return LoadingContainer();
       }
       return FutureBuilder(
           future: snapshot.data[itemId],
           builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
                  if(!itemSnapshot.hasData) {
                    return LoadingContainer();
                  }
                  return buildTile(itemSnapshot.data, context);
           });
     },
   );
  }

  Widget buildTile(ItemModel item, BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/${item.id}');
          },
          title: Text(item.title),
          subtitle: Text('${item.score} points'),
          trailing: Column(
            children: [
              Icon(Icons.comment),
              Text('${item.descendants}')
            ],
          ),
        ),
        Divider(
          height: 8.0,
        )
      ],
    );

  }
}