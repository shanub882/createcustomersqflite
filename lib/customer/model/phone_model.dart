class PhoneModel {
  int id;
  String type;
  String phoneno;
  int customerId;

  PhoneModel({
    this.id = 0,
    this.type = '',
    this.phoneno = '',
    this.customerId = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'phoneno': phoneno,
      'customerId': customerId,
    };
  }

  factory PhoneModel.fromMap(Map<String, dynamic> json) {
    return PhoneModel(
      id: json['id'],
      type: json['type'],
      phoneno: json['phoneno'],
      customerId: json['customerId'],
    );
  }
}
