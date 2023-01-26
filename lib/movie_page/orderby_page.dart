import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timelineview_app/service/mixin_file/data_store.dart';
import 'package:timelineview_app/service/mixin_file/movie_model.dart';

class OrderByPage extends StatelessWidget {
  const OrderByPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dataStore = DataStore().moviesOrderBy.snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamPage'),
      ),
      body: StreamBuilder<QuerySnapshot<Movie>>(
        // クラスを型として使う.
        stream: dataStore, // withConverterのデータをstreamで流す.
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
            // ListView.builderで画面に描画する.
            itemCount: data.size,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: IconButton(
                  onPressed: () {
                    final document = data.docs[index].id;
                    final removeData = DataStore().removeMovies(document);
                  },
                  icon: const Icon(Icons.delete),
                ),
                title: Text(
                    data.docs[index].data().title), // Movieクラスのtitleプロパティを使う.
                subtitle: Row(
                  children: [
                    Text(data.docs[index].data().genre),
                    const SizedBox(width: 20),
                    // .toStringだと変な文字になるので、.toDate()の後に
                    // .と入力してString型に変換するコードを選ぶ.
                    Text(data.docs[index]
                        .data()
                        .createdAt
                        .toDate()
                        .toIso8601String())
                  ],
                ), // Movieクラスのgenreプロパティを使う.
              );
            },
          );
        },
      ),
    );
  }
}
