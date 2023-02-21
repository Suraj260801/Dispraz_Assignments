import 'package:flutter/material.dart';
import 'package:news_api/utils/news_tile.dart';

import '../models/news_model.dart';

class BookMarks extends StatelessWidget {

  const BookMarks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Article> articles=ModalRoute.of(context)!.settings.arguments as List<Article>;
    List<Article> bookMarkedArticles=[];
    for(int i=0;i<articles.length;i++){
      if(articles[i].isBookMarked==true) {
          bookMarkedArticles.add(articles[i]);
        }
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: ListView.separated(
          itemBuilder: (context,index){
            return NewsTile(article: bookMarkedArticles[index]);
          },
          separatorBuilder: (context,index)=>const Divider(
            height: 0,
          ),
          itemCount: bookMarkedArticles.length
      ),

    ) ;
  }
}
