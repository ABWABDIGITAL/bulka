import 'package:bulka/modules/faq/data/entities/faq_entity.dart';

class FaqModel extends FaqEntity {
  const FaqModel({required super.question, required super.answer,required super.id});

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      question: json['question'],
      answer: json['answer'],
      id: json['id'],
    );
  }
}
