import 'package:flutter/material.dart';
import 'package:timelineview_app/service/mixin_file/data_store.dart';

class AddMovie extends StatelessWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataStore = DataStore();
    final titleAdd = dataStore.titleController;
    final genreAdd = dataStore.genreController;

    return Scaffold(
      appBar: AppBar(
        title: Text('映画を追加する'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: titleAdd,
              decoration: InputDecoration(
                hintText: "映画名を入力",
              ),
            ),
            TextField(
              controller: genreAdd,
              decoration: InputDecoration(
                hintText: "映画のジャンルを入力",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  final addFunction =
                      dataStore.addMovies(titleAdd.text, genreAdd.text);
                },
                child: Text('映画を追加'))
          ],
        ),
      ),
    );
  }
}
