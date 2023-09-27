import 'package:flutter/material.dart';


class DeleteExample extends StatefulWidget {
  @override
  _DeleteExampleState createState() =>
      _DeleteExampleState();
}

class _DeleteExampleState extends State<DeleteExample> {
  List<String> dataList = ['riddhi', 'hardik', 'hema'];

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Confirmation'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  dataList.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Example'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataList[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(index);
              },
            ),
          );
        },
      ),
    );
  }
}
