

import 'package:express_news/VNexpressRSSItem.dart';
import 'package:express_news/ssr_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  RSSItem news;
   NewsDetail({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? rawDescription = news.description! ;
    // news.imageUrl = news.getImageUrl(rawDescription);
    // news.description = news.getDescription(rawDescription);
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title!),
      ),
      body: Center(
        child: Column(
          children: [
            Text(news.link!),
            Text(news.pubDate!),
            Text(news.title!),
            Text(news.description!),
            // Text(news.imageUrl!)
          ],
        ),
      ),
    );
  }
}
