import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;

import 'myhomepage.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //deklarasi variabel form
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  //function add
  void addData() {
    var url = "https://herryprasetyo.my.id/latihan/adddata.php";
    client.post(Uri.parse(url), body: {
      "item_code": controllerCode.text,
      "item_name": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(
                    hintText: 'Item Code',
                    labelText: 'Item Code',
                  ),
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                    hintText: 'Item Name',
                    labelText: 'Item Name',
                  ),
                ),
                TextField(
                  controller: controllerPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Price',
                    labelText: 'Price',
                  ),
                ),
                TextField(
                  controller: controllerStock,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Stock',
                    labelText: 'Stock',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //function simpan
                    addData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Simpan',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
