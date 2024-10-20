class UserLanguageEntity {
  int id;
  int langId;
  int levelId;
  final String language;
  final String level;
  final String flag;

  UserLanguageEntity({
    required this.language,
    required this.langId,
    required this.levelId,
    required this.level,
    required this.id,
    required this.flag,
  });
}
