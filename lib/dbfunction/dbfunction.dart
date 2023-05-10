import 'package:assignment/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

//studentListNotifier(object of valuenotifier) contains list type values passed in via ValueNotifier constructor
ValueNotifier<List<UserModel>> userValueNotifier = ValueNotifier([]);

Future<UserModel> addUserToDB(UserModel value) async {
  final userDB = await Hive.openBox<UserModel>('userdb');

  //add value into hive
  final id = await userDB.add(value);

  //assign id of value as the the id generated and returned by hive when value is added
  value.id = id;

  //add value into studentListNotifier list and then notify the widgets listening to it via notifyListneres.
  userValueNotifier.value.add(value);
  userValueNotifier.notifyListeners();
  return value;
}

Future<void> getallstudents() async {
  final studentDB = await Hive.openBox<UserModel>('userdb');
  userValueNotifier.value.clear();

  userValueNotifier.value.addAll(studentDB.values);
  userValueNotifier.notifyListeners();
}
