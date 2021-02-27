/*
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:test/test.dart';

import '../../lib/client.dart';
import '../dtos/test.dtos.dart';

void main() async {
  //var host = "test.servicestack.net";
  var host = "localhost:5000";
  var client = new JsonServiceClient("http://${host}");
  var httpClient = new HttpClient();

  _runServiceClient(int i) async {
    var response = await client.get(new Hello(name: "World"));
    print("request ${i}: ${response.result}");
  }

  _runServiceClientRaw(int i) async {
    String json = await client.getAs("/hello",
        args: {"name": "World"}, responseAs: TypeAs.string);
    print("request ${i}: ${json}");
  }

  _runHttpClient(int i) async {
    var req = await httpClient.openUrl("GET", Uri.http(host, "/hello/World"));
    req.headers.add("Accept", "application/json");
    var res = await req.close();
    var json = await res.transform(utf8.decoder).join();
    print("request ${i}: ${json}");
  }

  test('Run requests in periodic timer to test connection leak', () async {
    var i = 0;
    Timer.periodic(Duration(seconds: 2), (_) async {
      await _runServiceClient(++i);
      // await _runServiceClientRaw(++i);
      // await _runHttpClient(++i);
    });
  });
}
*/
