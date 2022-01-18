import 'package:flutter/material.dart';
import 'package:app_berita/splashscreen_view.dart';
import 'package:app_berita/components/customListTile.dart';
import 'package:app_berita/models/article_model.dart';
import 'package:app_berita/services/api_service.dart';
import 'package:app_berita/navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        'halaman': (BuildContext context) => new halaman(),
        'technology': (BuildContext context) => new HomePage1(),
        'sport': (BuildContext context) => new HomePage2(),
        'profile': (BuildContext context) => new HomePage3(),
      },
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  berita_tecno createState() => berita_tecno();
}

class berita_tecno extends State<HomePage1> {
  ApiService_tecno client = ApiService_tecno();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          title:
              Text("Technology Updates", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.teal),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class HomePage2 extends StatefulWidget {
  @override
  berita_sport createState() => berita_sport();
}

class berita_sport extends State<HomePage2> {
  ApiService_sport client = ApiService_sport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          title: Text("Sport Updates", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.teal),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class HomePage3 extends StatefulWidget {
  @override
  profile createState() => profile();
}

class profile extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text("Profile"),
            backgroundColor: Colors.teal,
          ),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/asi.jpg'),
              ),
              Text(
                'Universitas Islam Kalimantan MAB',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading:
                      Icon(Icons.account_circle_outlined, color: Colors.blue),
                  title: Text(
                    'Asiyah',
                    style:
                        TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading:
                      Icon(Icons.assignment_ind_outlined, color: Colors.blue),
                  title: Text(
                    '19710081',
                    style:
                        TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.school_outlined, color: Colors.blue),
                  title: Text(
                    '5A SI REG PAGI BJM',
                    style:
                        TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(
                    left: 25.0, top: 25.0, right: 25.0, bottom: 25.0),
                child: ListTile(
                  leading:
                      Icon(Icons.contact_phone_outlined, color: Colors.blue),
                  title: Text(
                    '+62 822 5492 2830',
                    style:
                        TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home_outlined, color: Colors.blue),
                  title: Text(
                    'Trans Kalimantan, Handil Bakti',
                    style:
                        TextStyle(fontSize: 20.0, color: Colors.teal.shade900),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
