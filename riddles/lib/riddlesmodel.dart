/// title : "What Am I?"
/// question : "What am I?I look exactly like you with no flaws,I can mimic everything you do perfectly not after or before you do it but exactly when you do it,I can be big or small,wide or thin,I'm as smart,fast,strong as you are no greater than and no less than.What am I?"
/// answer : "I am a reflection"

class Riddlesmodel {
  Riddlesmodel({
      String? title, 
      String? question, 
      String? answer,}){
    _title = title;
    _question = question;
    _answer = answer;
}

  Riddlesmodel.fromJson(dynamic json) {
    _title = json['title'];
    _question = json['question'];
    _answer = json['answer'];
  }
  String? _title;
  String? _question;
  String? _answer;
Riddlesmodel copyWith({  String? title,
  String? question,
  String? answer,
}) => Riddlesmodel(  title: title ?? _title,
  question: question ?? _question,
  answer: answer ?? _answer,
);
  String? get title => _title;
  String? get question => _question;
  String? get answer => _answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['question'] = _question;
    map['answer'] = _answer;
    return map;
  }

}