class ContactInfoVerifyEmailParams {
  final String email;
  final String? code;

  ContactInfoVerifyEmailParams({
    required this.email,
    this.code,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'email': email,
      'reset_code': code,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
