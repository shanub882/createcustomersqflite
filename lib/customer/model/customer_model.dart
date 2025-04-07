

class CustomerModel {
  int? id;
   String? customerCode;
   String? ledgerName;
   String? registeredName;
   String? registeredNameArabic;
   String? balance;
   String? type;
  //  DateTime? selectedDate;
    String? selectedDate;
  //  List<AddressModel>? address;
  //  List<phoneModel>? phone;
  //  List<emailModel>? email;
  //  List<TransactionModel>? transaction;
  //  List<bankModel>? bank;

  CustomerModel({
    this.id,
    this.customerCode,
   this.ledgerName,
   this.registeredName ,
   this.registeredNameArabic,
   this.balance ,
   this.type ,
   this.selectedDate,
  //  this.address, 
  //  this.phone,
  //  this.email,
  //  this.transaction,
  //  this.bank
   
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerCode': customerCode,
      'ledgerName': ledgerName,
      'registeredName': registeredName,
      'registeredNameArabic': registeredNameArabic,
      'balance': balance,
      'type': type,
      'selectedDate': selectedDate,
      // 'address': address,
      // 'phone': phone,
      // 'email': email,
      // 'transaction': transaction,
      // 'bank': bank,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      customerCode: json['customerCode'].toString(),
      ledgerName: json['ledgerName'].toString(),
      registeredName: json['registeredName'].toString(),
      registeredNameArabic: json['registeredNameArabic'].toString(),
      balance: json['balance'].toString(),
      type: json['type'].toString(),
    
      selectedDate: json['selectedDate'].toString(),
      // address: json['address'],
      // phone: json['phone'],
      // email: json['email'],
      // transaction: json['transaction'],
      // bank: json['bank'],
    );
  }


}
