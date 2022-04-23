import 'dart:convert';

class Learner {
  String firstName;
  String lastName;
  String email;
  String uid;
  String phoneNumber;
  Learner({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.uid,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'uid': uid,
      'phoneNumber': phoneNumber,
    };
  }

  factory Learner.fromMap(Map<String, dynamic> map) {
    return Learner(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Learner.fromJson(String source) =>
      Learner.fromMap(json.decode(source));

  Learner copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? uid,
    String? phoneNumber,
  }) {
    return Learner(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return 'Learner(firstName: $firstName, lastName: $lastName, email: $email, uid: $uid, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Learner &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.uid == uid &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        uid.hashCode ^
        phoneNumber.hashCode;
  }
}
