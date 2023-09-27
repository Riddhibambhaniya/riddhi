import 'package:flutter/material.dart';



class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}



class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List<Person> list1 = [
    Person("Alice", 25),
    Person("Bob", 30),
  ];

  List<Person> list2 = [
    Person("Charlie", 22),
    Person("David", 28),
  ];

  List<Person> combinedList = [];

  void combineLists() {
    setState(() {
      combinedList.clear(); // Clear the combined list to avoid duplications if this method is called multiple times.
      combinedList.addAll(list1);
      combinedList.addAll(list2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Combine Object Lists"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: combineLists,
            child: Text("Combine Lists"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: combinedList.length,
              itemBuilder: (context, index) {
                final person = combinedList[index];
                return ListTile(
                  title: Text(person.name),
                  subtitle: Text("Age: ${person.age}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
