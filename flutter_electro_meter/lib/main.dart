import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(ScreenLanding());
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Electro Meter'),
        ),
        body: _Main(),
      ),
    );
  }
}

class ScreenLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _Main extends StatefulWidget {
  const _Main({Key? key}) : super(key: key);

  @override
  __MainState createState() => __MainState();
}

class __MainState extends State<_Main> {
  Map electricData = Map();
  @override
  void initState() {
    retrieveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CText("Current: ${electricData['current']}"),
            CText("Voltage: ${electricData['voltage']}"),
            CText("Frequency: ${electricData['frequency']}"),
            CText("Power: ${electricData['power']}"),
            CText("Energy: ${electricData['energy']}"),
            CText("Power Factor: ${electricData['pf']}"),
          ],
        ),
      ),
    );
  }

  retrieveData() {
    final DatabaseReference db = FirebaseDatabase(app: Firebase.app()).reference();
    db.child('stats').onValue.listen((Event event) {
      setState(() {
        electricData = Map.from(event.snapshot.value);
      });
    });
  }
}

class CText extends StatelessWidget {
  const CText(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(text, style: TextStyle(fontSize: 25)),
    );
  }
}
