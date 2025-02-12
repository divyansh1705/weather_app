import 'dart:convert';
import 'package:http/http.dart' as http;

class Network{

  Network({required this.url});
  final String url;

  Future getData()async{
    final url = Uri.parse(this.url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
