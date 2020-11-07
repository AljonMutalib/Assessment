import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ImageModel {
  final String previewURL;
  final String pageURL;
  final String user;
  final String userImageURL;

ImageModel(this.previewURL, this.pageURL, this.user, this.userImageURL);

}


class PostImage {
  Future<List<ImageModel>> fetchDatafromApi() async {
    var newUrl = new Uri.https("https://pixabay.com/api/","",{ "key" : "xxxxxxxxxxx",
    });
    var res = await http.get(newUrl);
    if (res.statusCode == 200) {
      print(res.body.toString());
      var body = jsonDecode(res.body);
        List<ImageModel> tilelist = [];
      for (var u in body["hits"]) {
        ImageModel tileModel = ImageModel(u["previewURL"],u["pageURL"],u["user"],u["userImageURL"]);
          tilelist.add(tileModel);
      }
        return tilelist;
      } else {
      throw "Can't get images..";
    }
  }
}