class EmailSupportParams {
  final String email;
  final String subject;
  final String message;

  EmailSupportParams({
    required this.email,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'title': subject,
      'message': message,
    };
  }
}