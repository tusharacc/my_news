import 'package:flutter/material.dart';
import './fetch_data.dart';
import 'package:flutter_tts/flutter_tts.dart';
import './floating.dart';

class ReadNews extends StatelessWidget {
  final String url;
  String news;
  ReadNews(this.url);
  bool show = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
        title: Row(
            mainAxisSize:MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Text('News'),
              IconButton(
                  icon: Icon(Icons.speaker_phone),
                  onPressed: (){
                    print(news);
                    show = true;
                    FlutterTts flutterTts = new FlutterTts();
                    print(flutterTts);
                    var result =  flutterTts.speak(news);
                  }),
            show ? floatingButton(): new Container(),
            ]) ,
    ),
    body:FutureBuilder<Map>(
      future: GetDetails(url),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Awaiting result...');
          case ConnectionState.done:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            news = snapshot.data['content'];
            return Container(
              margin: EdgeInsets.all(8.0),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Text('${snapshot.data['content']}'),
              ),
            );
        }
      }
      )
    );
  }

}