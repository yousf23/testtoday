import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {

  await Hive.initFlutter();
  var mybox = await Hive.openBox('testBox');
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  var  xbox = Hive.box('testbox');
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            xbox.put('thekey', 'the value ');
            
          }, child: Text('button 1')),
          ElevatedButton(onPressed: () {}, child: Text('button 2')),
          Container(
            child: Column(
              children: [
                Text(xbox.get('thekey')),
                Image.network(
                    'https://github.githubassets.com/images/modules/logos_page/Octocat.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}
