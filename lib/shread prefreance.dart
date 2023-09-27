import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage346 extends StatefulWidget {
  MyHomePage346({Key, key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage346State createState() => _MyHomePage346State();
}

class _MyHomePage346State extends State<MyHomePage346> {
  int _counter = 0;


  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 5);
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
  }
  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = ((prefs.getInt('counter') ?? 0) + 1);
      prefs.setInt('counter', _counter);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}