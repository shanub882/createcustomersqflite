class EmailModel {
  int id;
  String type;
  String Email;
  int customerId;

  EmailModel({
    this.id = 0,
    this.type = '',
    this.Email = '',
    this.customerId = 0,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'type': type, 'Email': Email, 'customerId': customerId};
  }

  factory EmailModel.fromMap(Map<String, dynamic> json) {
    return EmailModel(
      id: json['id'],
      type: json['type'],
      Email: json['Email'],
      customerId: json['customerId'],
    );
  }
}
