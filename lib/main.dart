import 'package:flutter/material.dart';
import './fetch_data.dart';
import './news_bytes.dart';
import 'dart:core';

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
        // Column is a vertical, linear layout.
        child: Scaffold(
      appBar: AppBar(
        title: Text('NESW'),
      ),
      body: FutureBuilder<Map>(
          future: NewsType(),
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Text('Awaiting result...');
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                print(snapshot.data['data'].length);
                return ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.all(8.0),
                          color: Colors.teal[200],
                          child: Center(
                              child: ListTile(
                                  title:
                                      Text('${snapshot.data['data'][index].toUpperCase()}',
                                        style: TextStyle(fontWeight: FontWeight.bold),),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsBytes(snapshot.data['data'][index]),
                                        ),
                                    );
                                  })));
                    });
            }
          }),
    ));
  }
}

void main() {
  //GetNews();
  runApp(MaterialApp(
    title: 'NESW', // used by the OS task switcher
    theme: ThemeData(fontFamily: 'Roboto Condensed'),
    home: MyScaffold(),
  ));
}
