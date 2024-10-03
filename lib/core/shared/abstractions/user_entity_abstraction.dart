abstract class UserEntity {
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String image;
}

class NormalUserEntity implements UserEntity {
  @override
  String email = 'test@test.com';

  @override
  int id = 1;

  @override
  String image = 'image';

  @override
  String name = 'Welcome ,Abdullah';

  @override
  String phone = '01099299390';
}

class CompanyUserEntity implements UserEntity {
  @override
  String email = 'test@test.com';
  @override
  int id = 1;
  @override
  String image = 'image';
  @override
  String name = 'Welcome ,Abdullah';
  @override
  String phone = '01099299390';
}
