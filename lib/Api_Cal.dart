import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Api_Cal extends StatefulWidget {
  const Api_Cal({Key? key}) : super(key: key);

  @override
  State<Api_Cal> createState() => _Api_CalState();
}

class _Api_CalState extends State<Api_Cal> {

  late String data;
  var superheros_length;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData() async {
    http.Response response =
    await http.get(Uri.parse("https://protocoderspoint.com/jsondata/superheros.json"));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superheros_length = jsonDecode(
            data)['superheros']; //get all the data from json string superheros
        print(superheros_length.length); // just printed length of data
      });
      var venam = jsonDecode(data)['superheros'][4]['url'];
      print(venam);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Http Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: superheros_length == null ? 0 : superheros_length.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Image.network(
                  jsonDecode(data)['superheros'][index]['url'],
                  fit: BoxFit.fill,
                  width: 100,
                  height: 500,
                  alignment: Alignment.center,
                ),
                title: Text(jsonDecode(data)['superheros'][index]['name']),
                subtitle: Text(jsonDecode(data)['superheros'][index]['power']),
              ),
            );
          },
        ),
      ),
    );
  }
}
