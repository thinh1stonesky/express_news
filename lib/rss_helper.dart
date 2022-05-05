
import 'dart:convert';

import 'package:express_news/VNexpressRSSItem.dart';
import 'package:http/http.dart' as http;
import 'package:express_news/ssr_item.dart';
import 'package:xml2json/xml2json.dart';

class RSSHelper{
  static String _rssURL = "https://vnexpress.net/rss/tin-moi-nhat.rss";
  static Future<List<RSSItem>?> readVNExpressRSS() async{
    var rssJsons = await fetchRSS();
    if(rssJsons!=null){
      var listRSSItem = rssJsons.map((item) => VNExpressRSSItem().getRSSFromJson(item)).toList();
      return listRSSItem;
    }else {
      return null;
    }
  }

  static Future<List<dynamic>?> fetchRSS() async {
    final response = await http.get(Uri.parse(_rssURL));
    if(response.statusCode == 200){
      final xml2Json = Xml2Json();
      xml2Json.parse(utf8.decode(response.bodyBytes));
      String rssJson = xml2Json.toParker();
      Map<String, dynamic> jsonData = jsonDecode(rssJson);
      return (jsonData["rss"]["channel"]["item"]);
    }
    return null;
  }
}

