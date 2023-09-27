import 'package:flutter/material.dart';

class Item {
  int id;
  String name;

  Item({required this.id, required this.name});
}


class MyHomePage99 extends StatefulWidget {
  @override
  _MyHomePage99State createState() => _MyHomePage99State();
}

class _MyHomePage99State extends State<MyHomePage99> {
  List<Item> itemList = [];
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize your list with some data
    itemList = [
      Item(id: 1, name: "Item 1"),
      Item(id: 2, name: "Item 2"),
    ];
  }

  void addItem() {
    int id = int.tryParse(idController.text) ?? 0;
    String name = nameController.text;
    if (id > 0 && name.isNotEmpty) {
      setState(() {
        itemList.add(Item(id: id, name: name));
        idController.clear();
        nameController.clear();
      });
    }
  }

  void updateItem(int id, String newName) {
    int index = itemList.indexWhere((item) => item.id == id);
    if (index != -1) {
      setState(() {
        itemList[index].name = newName;
      });
    }
  }

  void deleteItem(int id) {
    setState(() {
      itemList.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "ID"),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            ElevatedButton(
              onPressed: addItem,
              child: Text("Add Item"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  final item = itemList[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("ID: ${item.id}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Show a dialog to edit the item
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                String newName = item.name;
                                return AlertDialog(
                                  title: Text("Edit Item"),
                                  content: TextField(
                                    onChanged: (value) {
                                      newName = value;
                                    },
                                    controller: TextEditingController(text: item.name),
                                    decoration: InputDecoration(
                                      labelText: "New Name",
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        updateItem(item.id, newName);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Save"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteItem(item.id);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
