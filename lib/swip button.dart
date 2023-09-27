import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 140,
                vertical: 8,
              ),
              child: SwipeButton.expand(
                duration: const Duration(milliseconds: 200),
                thumb: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                activeThumbColor: Colors.red,
                activeTrackColor: Colors.grey.shade300,
                onSwipe: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Swipped"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text(
                  "",
                  style: TextStyle(
                    //color: Colors.,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}