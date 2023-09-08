import '../models/user.dart';
import '../repositories/user_repository.dart';

class UserService {
  late UserRepository _repository;

  UserService() {
    _repository = UserRepository();
  }

  Future<User?> login(String username, String password) async {
    var data = await _repository.readData();
    var users = data!.map((e) => User.fromMap(e)).toList();
    var user = users.firstWhere((element) => element.userName == username);
    if (user.userPassword == password) {
      return user;
    }
    return null;
  }

  // Create User
  Future<int> createUser(User user) async {
    user = User(
      userId: await _generateID(),
      userName: user.userName,
      userPassword: user.userPassword,
    );
    return (await _repository.insertData(user.toMap()))!;
  }

  // Get Users
  Future<List<User>> getUsers() async {
    var data = await _repository.readData();
    return data!.map((e) => User.fromMap(e)).toList();
  }

  // Edit User
  Future<int> updateUser(User user) async {
    return (await _repository.updateData(user.toMap()))!;
  }

  // Delete User
  Future<int> deleteUser(int userId) async {
    return (await _repository.deleteDataById(userId))!;
  }

  Future<int> _generateID() async {
    final users = await getUsers();
    users.sort((a,b) => a.userId.compareTo(b.userId));
    return users.last.userId + 1;
  }
}
