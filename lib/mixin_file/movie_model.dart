import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  Movie({required this.title, required this.genre, required this.createdAt});

  Movie.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String, // Stringにcastする.
          genre: json['genre']! as String, // Stringにcastする.
          createdAt: json['createdAt']! as Timestamp, // Timestampにcastする.
        );

  final String title; // 映画のタイトル.
  final String genre; // 映画のジャンル.
  final Timestamp createdAt; // データが作成された時間.

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'genre': genre,
      'createdAt': createdAt,
    };
  }
}

final moviesRef =
    FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
          fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
