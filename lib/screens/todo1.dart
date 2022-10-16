import 'package:flutter/material.dart';

class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TODOAPPState createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODO> {
  late String value;
  final Color _iconColor = Colors.black;

  var listTODO = [''];

  addToDO(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TODO APP"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addToDO(value);
          },
        ),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Add Item"),
                        onChanged: (val) {
                          value = val;
                        },
                      ),
                    )
                  : ListTile(
                      leading: IconButton(
                        onPressed: () {
                          setState() {
                            _iconColor:
                            Colors.red;
                          }

                          ;
                        },
                        icon: Icon(Icons.check_box, color: _iconColor),
                      ),
                      title: Text(
                        listTODO[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
            }));
  }
}
