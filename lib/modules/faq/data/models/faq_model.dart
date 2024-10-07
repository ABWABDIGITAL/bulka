import 'package:bulka/modules/faq/data/entities/faq_entity.dart';

class FaqModel extends FaqEntity {
  const FaqModel({required super.question, required super.answer});

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      question: json['question'],
      answer: json['answer'],
    );
  }
}
