import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlays'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Delete?'),
                      content: Text('Are you sure want to delete?'),
                      icon: Icon(Icons.delete),
                      actions: [
                        TextButton(
                            onPressed: () {
                              //delete the item
                              Navigator.pop(context);
                            },
                            child: Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No'))
                      ],
                    );
                  });
            },
            child: Text('Alert Dialog'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) {
                      return SimpleDialog(
                        contentPadding: EdgeInsets.symmetric(horizontal: 11),
                        title: Text('Choose your Country'),
                        children: [
                          SimpleDialogOption(
                            child: Text('India'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SimpleDialogOption(
                            child: Text('Russia'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Text('Simple Dialog')),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) {
                      return AboutDialog(
                        applicationIcon: Icon(Icons.ac_unit_outlined),
                        applicationName: "Classico",
                        applicationVersion: "v1.0",
                        applicationLegalese: "Powered by META",
                      );
                    });
              },
              child: Text('About Dialog')),
          ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: "custom",
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(21)),
                          margin: EdgeInsets.symmetric(horizontal: 11),
                          padding: EdgeInsets.symmetric(horizontal: 11),
                          height: 250,
                          child: Material(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Add Note',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                TextField(),
                                SizedBox(
                                  height: 11,
                                ),
                                TextField(),
                                SizedBox(
                                  height: 21,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Add')),
                                    ElevatedButton(
                                        onPressed: () {}, child: Text('Cancel'))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text('General Dialog')),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('  You\'re back online'),
                  backgroundColor: Colors.green,
                  margin: EdgeInsets.all(11),
                  padding: EdgeInsets.symmetric(vertical: 11),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {},
                    label: 'Proceed',
                  ),
                  showCloseIcon: true,
                ));
              },
              child: Text('Show SnackBar')),
          ElevatedButton(
              onPressed: () async {
                var dateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000, 8, 29),
                    lastDate: DateTime.now());

                if (dateTime != null) {
                  print(
                      "selected Date: ${dateTime.day}/${dateTime.month}/${dateTime.year}");
                }
              },
              child: Text('Show Date Picker')),
          ElevatedButton(
              onPressed: () async {
                var dateTime = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000, 8, 29),
                    lastDate: DateTime.now());

                if (dateTime != null) {
                  print(
                      "selected Date: ${dateTime.start.day}/${dateTime.start.month}/${dateTime.start.year} - ${dateTime.end.day}/${dateTime.end.month}/${dateTime.end.year}");
                }
              },
              child: Text('Show Date Range Picker')),
          ElevatedButton(
              onPressed: () async {
                var timeDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 10, minute: 10),
                );

                if (timeDay != null) {
                  print("selected Time: ${timeDay.hour}: ${timeDay.minute}");
                }
              },
              child: Text('Show Time Picker')),
        ],
      ),
    );
  }
}
