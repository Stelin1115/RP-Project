import 'package:rp_project/Auth_Service/User_Entity.dart';

abstract class AuthService {
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserEntity> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
