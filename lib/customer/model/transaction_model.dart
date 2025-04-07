

class TransactionModel {
  int? id;
String? priceCategoryName;
String? country;
String? taxTreatment;
String? creditPeriod;
String? creditLimit;
bool? billWiseApplicable;
bool? isActive;
String? partyIdentificationCode;
String? idNo;
String? salesDiscount;
int? customerId;

TransactionModel({
  this.id,
  this.priceCategoryName,
  this.country,
  this.taxTreatment,
  this.creditPeriod,
  this.creditLimit,
  this.billWiseApplicable,
  this.isActive,
  this.partyIdentificationCode,
  this.idNo,
  this.salesDiscount,
  this.customerId
});

Map<String,dynamic> toMap(){
  return {
    'id':id,
    'priceCategoryName':priceCategoryName,
    'country':country,
    'taxTreatment':taxTreatment,
    'creditPeriod': creditPeriod,
    'creditLimit': creditLimit,
    'billWiseApplicable': billWiseApplicable,
    'isActive':isActive,
    'partyIdentificationCode':partyIdentificationCode,
    'idNo':idNo,
    'salesDiscount':salesDiscount,
    'customerId':customerId
  };
}

factory TransactionModel.fromMap(Map<String,dynamic>json){
  return TransactionModel(
   id: json['id'],
    priceCategoryName: json['priceCategoryName'],
     country: json['country'],
     taxTreatment: json['taxTreatment'],
     creditPeriod: json['creditPeriod'],
     creditLimit: json['creditLimit'],
     billWiseApplicable: json['billWiseApplicable']==1,
     isActive: json['isActive']==1,
     partyIdentificationCode: json['partyIdentificationCode'],
     idNo: json['idNo'],
     salesDiscount: json['salesDiscount'],
     customerId: json['customerId'],
  );
}

}