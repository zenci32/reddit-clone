import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reddit_clone/model/reddit_model.dart';

class Methods {
  List<RedditModel> liste = [];
  Future httpGet() async {
    var url =
        Uri.parse("https://www.reddit.com/r/flutterdev/top.json?count=20");
    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      var body = await jsonDecode(response.body);
      liste.add(RedditModel.fromMap(body));
      return liste;
    }
    if (response.statusCode == 401) {
      print("401 UNAUTHORİZED");
    }
  }
}
