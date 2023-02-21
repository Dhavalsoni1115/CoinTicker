import 'dart:convert';
import 'package:http/http.dart';

Future<dynamic> getCryptoApi(
    {required String crypto, required String currency}) async {
  try {
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=C2DE038E-C186-4A14-A767-D63C5F04D02C';
    dynamic response = Response;
    response = await get(
      Uri.parse(url),
    );
    dynamic data = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      // print(data);
      return data;
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print(e);
  }
}
