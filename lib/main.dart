import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dynamic Tabs Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  List list_name = ["Tab1", "Tab2", "Tab3", "Tab4", "New Tab"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: list_name.length,
      child: Scaffold(
        /*
        appBar: AppBar(
          title: const Text('Dynmic Tabs'),
        ),
        */
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25.6),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: List<Widget>.generate(list_name.length, (int index) {
                    return Tab(text: list_name[index]);
                  }),
                  onTap: (index) {
                    if (kDebugMode) {
                      print('Index: ' + index.toString());
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: TabBarView(
                  children: List<Widget>.generate(list_name.length, (int index) {
                    return Tab(text: list_name[index]);
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
