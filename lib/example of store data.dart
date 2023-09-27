// import 'package:flutter/material.dart';
//
//
//
// class RowWithPopupMenu extends StatefulWidget {
//   @override
//   _RowWithPopupMenuState createState() => _RowWithPopupMenuState();
// }
//
// class _RowWithPopupMenuState extends State<RowWithPopupMenu> {
//   String dataToStore = ''; // Store data here
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Row with Popup Menu Example'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 'Data to Store: $dataToStore',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ),
//             PopupMenuButton<String>(
//               onSelected: (result) {
//                 if (result == 'Yes') {
//                   // Store data when 'Yes' is selected
//                   setState(() {
//                     dataToStore = 'riddhi';
//                   });
//                 }
//               },
//               itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                 PopupMenuItem<String>(
//                   value: 'Yes',
//                   child: Text('Yes'),
//                 ),
//                 PopupMenuItem<String>(
//                   value: 'No',
//                   child: Text('No'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeleteConfirmationExample(),
    );
  }
}

class DeleteConfirmationExample extends StatefulWidget {
  @override
  _DeleteConfirmationExampleState createState() =>
      _DeleteConfirmationExampleState();
}

class _DeleteConfirmationExampleState extends State<DeleteConfirmationExample> {
  List<String> dataList = ['Item 1', 'Item 2', 'Item 3'];

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
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  dataList.removeAt(index); // Delete the item
                });
                Navigator.of(context).pop(); // Close the dialog
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
        title: Text('Delete Confirmation Example'),
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
