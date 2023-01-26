import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:timelineview_app/service/mixin_file/movie_model.dart';

mixin MoviesConverter {
  // Formで入力に使うコントローラー.
  final TextEditingController titleController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  // FireStoreの値を全て取得する.
  final moviesConverter =
      FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
            fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
  // FireStoreにデータを追加する.
  Future<void> addMovies(String title, String genre) async {
    // 作成時刻を取得.
    final now = DateTime.now();

    // 映画情報を追加.
    await moviesConverter.add(
      Movie(title: title, genre: genre, createdAt: Timestamp.fromDate(now)),
    );
  }
  // FireStoreにデータを削除する.
  Future<void> removeMovies(dynamic document) async {
    // 映画情報を追加.
    await moviesConverter.doc(document).delete();
  }
}
