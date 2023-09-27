import 'package:flutter/material.dart';

class DynamicWidgetExample extends StatefulWidget {
  @override
  _DynamicWidgetExampleState createState() => _DynamicWidgetExampleState();
}

class _DynamicWidgetExampleState extends State<DynamicWidgetExample> {
  List<String> dynamicData = ['Widget 1', 'Widget 2', 'Widget 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Widget Example'),
      ),
      body: Column(
        children: [
          // Display dynamic widgets
          for (String data in dynamicData)
            DynamicItemWidget(
              data: data,
              onDelete: () {
                setState(() {
                  dynamicData.remove(data);
                });
              },
            ),
          // Add button to dynamically add widgets
          ElevatedButton(
            onPressed: () {
              setState(() {
                dynamicData.add('Widget ${dynamicData.length + 1}');
              });
            },
            child: Text('Add Widget'),
          ),
        ],
      ),
    );
  }
}

class DynamicItemWidget extends StatelessWidget {
  final String data;
  final VoidCallback onDelete;

  const DynamicItemWidget({required this.data, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class DynamicWidgetExample extends StatefulWidget {
//   @override
//   _DynamicWidgetExampleState createState() => _DynamicWidgetExampleState();
// }
//
// class _DynamicWidgetExampleState extends State<DynamicWidgetExample> {
//   List<String> dynamicData = ['Widget 1', 'Widget 2', 'Widget 3'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dynamic Widget Example'),
//       ),
//       body: ListView.builder(
//         itemCount: dynamicData.length,
//         itemBuilder: (context, index) {
//           return Dismissible(
//             key: Key(dynamicData[index]),
//             onDismissed: (direction) {
//               setState(() {
//                 dynamicData.removeAt(index);
//               });
//             },
//             background: Container(
//               color: Colors.red,
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.only(right: 16.0),
//               child: Icon(
//                 Icons.delete,
//                 color: Colors.white,
//               ),
//             ),
//             child: DynamicItemWidget(
//               data: dynamicData[index],
//               onSwipe: () {
//                 // Handle the swipe action here, e.g., open for data storage
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Swipe action for ${dynamicData[index]}'),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             dynamicData.add('Widget ${dynamicData.length + 1}');
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class DynamicItemWidget extends StatelessWidget {
//   final String data;
//   final VoidCallback onSwipe;
//
//   const DynamicItemWidget({required this.data, required this.onSwipe});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(data),
//       trailing: ElevatedButton(
//         onPressed: onSwipe,
//         child: Text('Swipe'),
//       ),
//     );
//   }
// }
