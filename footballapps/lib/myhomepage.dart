import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'addpage.dart';
import 'detailpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //function get data
  Future<List> getData() async {
    //buat variabel
    String url = "https://herryprasetyo.my.id/latihan/get_data.php";
    final response = await http.get(
      Uri.parse(url),
    );

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GetData'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddPage(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : Center(
                    child: Text('Gagal Loading'),
                  );
          },
        ));
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, index) {
        return Container(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(list: list, index: index),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(list[index]['item_name']),
                leading: Icon(
                  Icons.widgets,
                ),
                subtitle: Text(
                  'Stock: ${list[index]['stock']}',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
