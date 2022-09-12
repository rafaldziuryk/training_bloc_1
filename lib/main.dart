import 'package:bloc_1/bloc_0/page_0.dart';
import 'package:bloc_1/bloc_1/page_1.dart';
import 'package:bloc_1/bloc_2/page_2.dart';
import 'package:bloc_1/bloc_3/page_3.dart';
import 'package:bloc_1/bloc_5_con/page_5_con.dart';
import 'package:bloc_1/bloc_5_seq/page_5_seq.dart';
import 'package:flutter/material.dart';

import 'bloc_4/page_4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Bloc0(),
              )),
              child: const Text('Step 0'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Bloc1(),
              )),
              child: const Text('Step 1'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Bloc2(),
              )),
              child: const Text('Step 2'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Bloc3(),
              )),
              child: const Text('Step 3'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Bloc4(),
              )),
              child: const Text('Step 4'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Bloc5Con(),
              )),
              child: const Text('Step 5 Con'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Bloc5Seq(),
              )),
              child: const Text('Step 5 Seq'),
            ),
          ],
        ),
      ),
    );
  }
}
