import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String photo;
  final String uid;
  final String bio;
  final String email;
  final List followers;
  final List following;

  UserModel({
    required this.username,
    required this.photo,
    required this.uid,
    required this.bio,
    required this.email,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
        'photo': photo,
        'bio': bio,
        'following': following,
        'followers': followers,
      };

  static UserModel fromSnap(DocumentSnapshot docSnap) {
    var snap = docSnap.data() as Map<String, dynamic>;

    return UserModel(
      username: snap['username'],
      photo: snap['photo'],
      uid: snap['uid'],
      bio: snap['bio'],
      email: snap['email'],
      followers: snap['followers'],
      following: snap['following'],
    );
  }
}
