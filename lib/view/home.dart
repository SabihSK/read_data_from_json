import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Load data from Json"),
        ),
        body: Container(
          child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("assets/person.json"),
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Name: " +
                            (mydata[index]["name"] != null
                                ? mydata[index]["name"]
                                : '')),
                        Text("Age: " + mydata[index]["age"]),
                        Text("Height: " + mydata[index]["height"]),
                        Text("Gender: " + mydata[index]["gender"]),
                        Text("Hair Color: " + mydata[index]["hair_color"]),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
