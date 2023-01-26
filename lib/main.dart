import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:timelineview_app/ui/movie_page/add_movie.dart';
import 'package:timelineview_app/ui/movie_page/orderby_page.dart';
import 'package:timelineview_app/ui/movie_page/stream_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectPage(),
    );
  }
}

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ページを選択'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StreamPage()));
                },
                child: Text('Stream')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderByPage()));
                },
                child: Text('OrderBy')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddMovie()));
                },
                child: Text('AddMovie')),
          ],
        ),
      ),
    );
  }
}
