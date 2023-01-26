import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timelineview_app/service/mixin_file/movie_model.dart';
import 'package:timelineview_app/service/mixin_file/movies_converter.dart';

// mixinを継承したクラス。アプリではこのクラスを呼び出す!
class DataStore with MoviesConverter {
  // falseにすると、昇順でデータを並び替える.
  final moviesOrderBy = FirebaseFirestore.instance
      .collection('movies')
      .orderBy('createdAt', descending: false)
      .withConverter<Movie>(
        fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
}
