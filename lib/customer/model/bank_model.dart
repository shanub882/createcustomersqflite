class BankModel {
  int id;
  String label;
  String bankname;
  String accountname;
  String accountno;
  String ifsccode;
  int customerId;

  BankModel({
    this.id = 0,
    this.label = '',
    this.bankname = '',
    this.accountname = '',
    this.accountno = '',
    this.ifsccode = '',
    this.customerId = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'bankname': bankname,
      'accountname': accountname,
      'accountno': accountno,
      'ifsccode': ifsccode,
      'customerId': customerId,
    };
  }

  factory BankModel.fromMap(Map<String, dynamic> json) {
    return BankModel(
      id: json['id'],
      label: json['label'],
      bankname: json['bankname'],
      accountname: json['accountname'],
      accountno: json['accountno'],
      ifsccode: json['ifsccode'],
      customerId: json['customerId'],
    );
  }
}
