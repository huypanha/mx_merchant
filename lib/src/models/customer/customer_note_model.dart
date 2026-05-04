class MxCustomerNoteModel {
  final int id;
  final String? text;
  final String? author;
  final String? authorId;
  final String? created;
  final String? modified;

  MxCustomerNoteModel({this.id = 0, this.text, this.author, this.authorId, this.created, this.modified});

  factory MxCustomerNoteModel.fromJson(Map<String, dynamic> json) {
    return MxCustomerNoteModel(
      id: json['id'] ?? 0,
      text: json['text'],
      author: json['author'],
      authorId: json['authorId'],
      created: json['created'],
      modified: json['modified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'author': author, 'authorId': authorId, 'created': created, 'modified': modified}
      ..removeWhere((_, v) => v == null);
  }

  static List<MxCustomerNoteModel> fromJsonArray(List array) => array.map((e) => MxCustomerNoteModel.fromJson(Map<String, dynamic>.from(e))).toList();
}
