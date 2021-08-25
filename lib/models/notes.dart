class Note {
  String? id;
  String? title;
  String? description;
  DateTime? dateCreated;

  Note({this.id, this.title, this.description, this.dateCreated});

  Map<String, dynamic> toJason() => {
        'id': id,
        'title': title,
        'description': description,
        'dateCreated': dateCreated!.toUtc(),
      };

  //

  static Note fromJason(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        dateCreated: json['dateCreated'].toDate(),
      );
}
