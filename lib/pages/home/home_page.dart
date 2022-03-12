import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Food'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: handleClickButton ,
                child: Text('Load foods data'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  handleClickButton() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods') ;
    var result = await http.get(url) ;
    print(result.body) ;

    var json = jsonDecode(result.body) ;
    String status = json['status'] ;
    String? message = json['message'] ;
    List<Map<String, dynamic>> data = json['data'] ;


  }
}
