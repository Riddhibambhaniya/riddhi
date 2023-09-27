import 'package:flutter/material.dart';

class MyData {
  String name;

  MyData({required this.name});
}


class MyHomePage88 extends StatefulWidget {
  @override
  _MyHomePage88State createState() => _MyHomePage88State();
}

class _MyHomePage88State extends State<MyHomePage88> {
  TextEditingController searchController = TextEditingController();
  List<MyData> dataList = [];
  List<MyData> filteredList = [];

  @override
  void initState() {
    super.initState();

    dataList = [
      MyData(name: "Riddhi"),
      MyData(name: "Hardik"),
      MyData(name: "John"),
      MyData(name: "rekha"),

    ];
    filteredList.addAll(dataList);
  }

  void filterData(String query) {
    setState(() {
      filteredList = dataList
          .where((data) => data.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void addData(String name) {
    setState(() {
      dataList.add(MyData(name: name));
      filterData(searchController.text);
    });
  }

  void deleteData(int index) {
    setState(() {
      dataList.removeAt(index);
      filterData(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Example"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                filterData(query);
              },
              decoration: InputDecoration(
                hintText: "Search...",
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final item = filteredList[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Add item functionality
                          addData(item.name);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Delete item functionality
                          deleteData(dataList.indexOf(item));
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
    );
  }
}
