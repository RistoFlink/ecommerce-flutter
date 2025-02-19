import 'dart:convert';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String country;
  final String city;
  final String password;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.country,
    required this.city,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "country": country,
      "city": city,
      "password": password,
    };
  }

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["_id"] is String ? map["_id"] : "",
      firstName: map["firstName"] is String ? map["firstName"] : "",
      lastName: map["lastName"] is String ? map["lastName"] : "",
      email: map["email"] is String ? map["email"] : "",
      country: map["country"] is String ? map["country"] : "",
      city: map["city"] is String ? map["city"] : "",
      password: map["password"] is String ? map["password"] : "",
    );
  }
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
