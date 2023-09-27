import 'package:flutter/material.dart';


class DynamicListScreen extends StatefulWidget {
  @override
  _DynamicListScreenState createState() => _DynamicListScreenState();
}

class _DynamicListScreenState extends State<DynamicListScreen> {
  List<String> items = ["Item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic List Example"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              // You can add code to handle item tap here
              // For example, remove the item from the list
              setState(() {
                items.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You can add code to add new items to the list here
          setState(() {
            items.add("New Item");
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
