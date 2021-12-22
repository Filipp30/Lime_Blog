

import 'package:flutter_forum/Models/user_model.dart';
import 'package:flutter_forum/Services/data_base_service.dart';

abstract class AuthBase {
  Future<int> createNewUser(UserModel userModel);
  Future<int> login(UserModel userModel);
}




class AuthProvider implements AuthBase{

  @override
  Future<int> createNewUser(UserModel userModel) async {
    int response = await DataBaseService.createNewUser(userModel);
    return response;
  }

  @override
  Future<int> login(UserModel userModel) async {
    int response = await DataBaseService.loginWitchCredentials(userModel);
    return response;
  }
}