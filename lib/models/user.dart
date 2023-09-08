class User {
  final int id;
  final int userId;
  final String userName;
  final String userPassword;

  const User({
    this.id = 0,
    required this.userId,
    required this.userName,
    required this.userPassword,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
    result.addAll({'userPassword': userPassword});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      userId: map['userId']?.toInt(),
      userName: map['userName'],
      userPassword: map['userPassword'],
    );
  }

  @override
  String toString() {
    return 'User(userId: $userId, userName: $userName, userPassword: $userPassword)';
  }
}