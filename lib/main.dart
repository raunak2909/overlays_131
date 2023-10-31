import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  bool isOpen = false;

  List<String> listRadioOptions = [
    "Male",
    "Female",
    "Other"
  ];

  var selectedGender = "";

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
          ElevatedButton(
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) {
                      return Container(
                        height: 250,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                          onDateTimeChanged: (DateTime value) {
                            print(
                                "Selected Date: ${value.day}/${value.month}/${value.year}, ${value.hour}:${value.minute}");
                          },
                          initialDateTime: DateTime.now(),
                          maximumDate: DateTime.now().add(Duration(days: 7)),
                          minimumDate: DateTime(2000, 9, 29),
                        ),
                      );
                    });
              },
              child: Text('Cupertino')),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  activeColor: Colors.green,
                  checkColor: Colors.yellow,
                  fillColor: MaterialStateColor.resolveWith((states){
                    print(states);
                    if(states.contains(MaterialState.selected)){
                      return Colors.green;
                    }
                    return Colors.tealAccent;
                  }),
                  value: isChecked,
                  splashRadius: 50,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    isChecked = value!;
                    setState(() {});
                  }),
              Text("Remember me")
            ],
          ),*/
          CheckboxListTile(
              autofocus: true,
              onFocusChange: (value){
                print("Checkbox 1: $value");
              },
            title: Text("Remember Me"),
              controlAffinity: ListTileControlAffinity.leading,
              value: isChecked, onChanged: (value){
            isChecked = value!;
            setState(() {

            });
          }),/*
          CheckboxListTile(
            onFocusChange: (value){
              print("Checkbox 2: $value");
            },
              title: Text("Remember Me"),
              controlAffinity: ListTileControlAffinity.leading,
              value: isChecked, onChanged: (value){
            isChecked = value!;
            setState(() {

            });
          }),*/
          RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(listRadioOptions[0]),
              value: listRadioOptions[0], groupValue: selectedGender, onChanged: (value){
            selectedGender = value!;
            setState(() {

            });
          }),
          RadioListTile(
              title: Text(listRadioOptions[1]),
              value: listRadioOptions[1], groupValue: selectedGender, onChanged: (value){
            selectedGender = value!;
            setState(() {

            });
          }),
          RadioListTile(
              title: Text(listRadioOptions[2]),
              value: listRadioOptions[2], groupValue: selectedGender, onChanged: (value){
            selectedGender = value!;
            setState(() {

            });
          }),
          SwitchListTile(
            title: Text("Theme"),
            controlAffinity: ListTileControlAffinity.leading,
            splashRadius: 34,
              activeColor: Colors.cyan,
              subtitle: Text("Change Your App theme.."),
              thumbIcon: MaterialStateProperty.resolveWith((states) {
                if(states.contains(MaterialState.selected)){
                  return Icon(Icons.sunny, color: Colors.white,);
                }
                return Icon(Icons.nightlight);
              }),
              thumbColor: MaterialStateColor.resolveWith((states){
                print(states);
                if(states.contains(MaterialState.selected)){
                  return Colors.amber;
                }
                return Colors.black;
              }),
              value: isOpen, onChanged: (value){
            isOpen = value!;
            setState(() {

            });
          })
        ],
      ),
      /*floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34)
            ),
            onPressed: (){

            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton.large(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
            ),
            onPressed: (){

            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton.extended(
            label: Text("Add"),
            onPressed: (){

            },
            icon: Icon(Icons.add),
          ),
        ],
      ),*/
      /*floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,*/
    );
  }
}
