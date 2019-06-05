import 'package:flutter/material.dart';
import './fetch_data.dart';
import './read_news.dart';

class NewsBytes extends StatelessWidget {

  final String newsType;

  NewsBytes(this.newsType);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('News'),
      ),
      body:FutureBuilder<Map>(
      future: GetNews(newsType),
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
            print(snapshot.data['data'].length);
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: snapshot.data['data'].length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.all(8.0),
                  color: Colors.teal[200],
                  child: Center(
                    child: ListTile(
                      trailing: Row(
                          mainAxisSize:MainAxisSize.min,
                          children: <Widget>[
                          Icon(Icons.arrow_forward ),
                          Icon(Icons.speaker_phone),
                        ],
                      ),
                      title: Text('${snapshot.data['data'][index]["title"]}'),
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => ReadNews(snapshot.data['data'][index]["link"]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
          return null; // unreachable
        },
      )
    );
  }
}
