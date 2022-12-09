import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:text_translatter/Widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _transalatedController = TextEditingController();
  String dropdownvalue = 'English';
  String codes = "En";
  bool load = false;

  var items = [
    'English',
    'Marathi',
    'Hindi',
    'Japanees',
    'French',
  ];
  _DataResp() async {
    String url =
        "https://script.google.com/macros/s/AKfycbxkQeDET0ZTCZrWaAz1TRIy677dVaaSi-5FT2GYHeTbTLIaCtlx-_8HHHxLXYxZ3e-cbw/exec";

    var map = Map<String, String>();
    map['source_lang'] = "auto";
    map['target_lang'] = codes;
    map['text'] = _dataController.text;

    var resp = await http.post(
      Uri.parse(url),
      body: map,
    );
    Map<dynamic, dynamic> data = jsonDecode(resp.body);
    if (data['status'] == "fail") {
      load = false;
      setState(() {});
    } else {
      load = true;
      setState(() {
        _transalatedController.text = data['translatedText'];
      });
    }

    print(data['translatedText']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EditText(
            textController: _dataController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter Text",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.red),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.language),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Center(
                        child: Text(
                          items,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                    setState(() {
                      if (newValue == "English") {
                        codes = "En";
                      } else if (newValue == "Marathi") {
                        codes = "Mr";
                      } else if (newValue == "Hindi") {
                        codes = "Hi";
                      } else if (newValue == "Japanees") {
                        codes = "Ja";
                      } else if (newValue == "French") {
                        codes = "Fr";
                      }
                      print(codes);
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              _DataResp();
              setState(() {
                load = false;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black87,
              backgroundColor: Colors.yellow,
              padding: const EdgeInsets.all(
                10.0,
              ),
              fixedSize: const Size(
                300,
                50,
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              elevation: 15,
              shadowColor: Colors.yellow,
            ),
            child: const Text(
              "Translate",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          (load == false)
              ? const CircularProgressIndicator(
                  backgroundColor: Colors.red,
                )
              : EditText(
                  textController: _transalatedController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
        ],
      ),
    );
  }
}
