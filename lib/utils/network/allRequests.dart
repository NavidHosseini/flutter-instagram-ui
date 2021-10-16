import 'package:http/http.dart' as http;

getHttp(url) async {
  try {
    final Url = Uri.parse(url);
    var response = await http.get(Url);
    return response;
  } catch (e) {
    return e;
  }
}

postHttp(url, body, heder) async {
  try {
    var response = await http.post(
      url,
      body: body,
      headers: heder,
    );
    return response;
  } catch (e) {
    return 'err';
  }
}
