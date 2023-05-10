import 'package:hive/hive.dart';
part 'user.g.dart';


@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phonenumber;

  @HiveField(5)
  final String profession;

  UserModel(
      {required this.name,
      required this.password,
      required this.email,
      required this.phonenumber,
      required this.profession,
      this.id});
}
