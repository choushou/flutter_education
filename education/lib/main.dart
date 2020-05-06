import 'package:education/login_signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'draggable_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'DraggablePage': (context) => DraggablePage(),
        'LoginSignupPage': (context) => LoginSignupPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Connect'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  navigateTo('DraggablePage');
                },
                child: Text('DraggablePage'),
              ),
              RaisedButton(
                onPressed: () {
                  navigateTo('LoginSignupPage');
                },
                child: Text('LoginSignupPage'),
              ),
            ],
          )
      ), //center
    );
  }

  navigateTo(name) {
    Navigator.of(context).pushNamed(name);
  }
}
