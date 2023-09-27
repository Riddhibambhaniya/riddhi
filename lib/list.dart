import 'package:flutter/material.dart';


class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // Initialize an empty list to store items
  List<String> items = ['riddhi','sorathiya'];

  // Controller for the text input field
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Example"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: "Add an item",
            ),
            onSubmitted: (text) {
              // Add the item to the list when the user submits
              setState(() {
                items.add(text);
                _textController.clear();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the text controller when the widget is disposed
    _textController.dispose();
    super.dispose();
  }
}



// import 'package:flutter/material.dart';
//
//
// class  ListScreen extends StatelessWidget {
//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(10.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0, 2),
//               blurRadius: 5.0,
//             ),
//           ],
//         ),
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text(
//                 'Bottom Sheet Content',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'This is the content of the bottom sheet. You can add any widgets or content here.',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the bottom sheet
//                 },
//                 child: Text('Close'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bottom Sheet Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showBottomSheet(context);
//           },
//           child: Text('Show Bottom Sheet'),
//         ),
//       ),
//     );
//   }
// }
