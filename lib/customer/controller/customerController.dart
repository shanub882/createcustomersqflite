import 'dart:developer';

import 'package:customerdata_sqflite/customer/model/address_model.dart';
import 'package:customerdata_sqflite/customer/model/bank_model.dart';
import 'package:customerdata_sqflite/customer/model/customer_model.dart';
import 'package:customerdata_sqflite/customer/model/email_model.dart';
import 'package:customerdata_sqflite/customer/model/phone_model.dart';
import 'package:customerdata_sqflite/customer/model/transaction_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class CustomerController extends GetxController {
  late Database database;

  @override
  void onInit() async {
    await openCustomerDatabase();
    getCustomerList();
    getAddressList();
    getPhoneList();
    getEmailList();
    getTransactionList();
    getBankList();
    paginatedData();
    scrollController.addListener(_onScrollListner);
    super.onInit();
  }
  
   ScrollController scrollController = ScrollController();

 RxBool isloading = false.obs;
 RxInt limit = 9.obs;
 RxInt offset = 0.obs;

  RxBool ismorecontact = false.obs;
  RxBool ismoretransaction = false.obs;
  RxBool ismorebank = false.obs;

  ////  add address into list
  void addAddress({required int customerId}) {
    address.add(AddressModel(customerId: customerId));
  }

  ////  remove address from list
  void removeAddress(int index) {
    if (index >= 0 && index < address.length) {
      address.removeAt(index);
    }
  }

  // void updateAddress(AddressModel address) {
  //   final index = this.address.indexWhere((e) => e.id == address.id);
  //   if (index != -1) {
  //     this.address[index] = address;
  //   }
  // }

  //// updating address in list
  void updateAddress(AddressModel updatedModel) {
    int index = address.indexWhere((e) => e == updatedModel);
    if (index != -1) {
      address[index] = updatedModel;
    }
  }

  ////  add phone into list
  void addPhone({required int customerId}) {
    phone.add(PhoneModel(customerId: customerId));
  }

  ////  remove phone from list
  void removePhone(int index) {
    if (index >= 0 && index < phone.length) {
      phone.removeAt(index);
    }
  }

  //// updating phone in list
  void updatePhone(PhoneModel phone) {
    final index = this.phone.indexWhere((e) => e.id == phone.id);
    if (index != -1) {
      this.phone[index] = phone;
    }
  }

  ////  add email into list
  void addemail({required int customerId}) {
    email.add(EmailModel(customerId: customerId));
  }

  ////  remove email from list
  void removeEmail(int index) {
    if (index >= 0 && index < email.length) {
      email.removeAt(index);
    }
  }

  //// updating email in list
  void updateEmail(EmailModel email) {
    final index = this.email.indexWhere((e) => e.id == email.id);
    if (index != -1) {
      this.email[index] = email;
    }
  }

  ////  add bank into list
  void addBank({required int customerId}) {
    bank.add(BankModel(customerId: customerId));
  }

  ////  remove bank from list
  void removeBank(int index) {
    if (index >= 0 && index < bank.length) {
      bank.removeAt(index);
    }
  }

  //// updating bank in list
  void updateBank(BankModel bank) {
    final index = this.bank.indexWhere((e) => e.id == bank.id);
    if (index != -1) {
      this.bank[index] = bank;
    }
  }

  //// address section
  var label = <TextEditingController>[];
  var buildingNumber = <TextEditingController>[];
  var streetName = <TextEditingController>[];
  var streetNameArabic = <TextEditingController>[];
  var district = <TextEditingController>[];
  var districtArabic = <TextEditingController>[];
  var state = <TextEditingController>[];
  var stateArabic = <TextEditingController>[];
  var postalCode = <TextEditingController>[];
  var addressData;

  //// phone section
  var phoneType = <TextEditingController>[].obs;
  var phoneno = <TextEditingController>[].obs;
  var mobileData;

  //// email section
  var emailType = <TextEditingController>[];
  var Email = <TextEditingController>[];
  var emailData;

  //// transaction section
  TextEditingController creditLimit = TextEditingController();
  TextEditingController creditPeriod = TextEditingController();
  TextEditingController idNo = TextEditingController();
  TextEditingController salesDiscount = TextEditingController();

  //// bank section
  var ifsccode = <TextEditingController>[];
  var accountno = <TextEditingController>[];
  var accountname = <TextEditingController>[];
  var bankname = <TextEditingController>[];
  var bankLabel = <TextEditingController>[];
  var bankData;

  RxList<CustomerModel> customer = <CustomerModel>[].obs;
  RxList<AddressModel> address = <AddressModel>[].obs;
  RxList<PhoneModel> phone = <PhoneModel>[].obs;
  RxList<EmailModel> email = <EmailModel>[].obs;
  RxList<TransactionModel> transaction = <TransactionModel>[].obs;
  RxList<BankModel> bank = <BankModel>[].obs;

  //// customer section
  final TextEditingController customerCode = TextEditingController();
  final TextEditingController registerednameController =
      TextEditingController();
  final TextEditingController registerednameArabicController =
      TextEditingController();
  final TextEditingController ledgernameController = TextEditingController();
  final TextEditingController taxNoController = TextEditingController();
  TextEditingController balance = TextEditingController();
  TextEditingController dateController = TextEditingController();

  RxString dropdownvalue = 'DR'.obs;
  var countryname = ["India", "UAE", "Saudi Arabia"].obs;
  var items = ['DR', 'CR'];
  var pricecategoryList = ["Salesprice1", "Salesprice2", "Salesprice3"].obs;
  RxString selectedPriceCategory = "Salesprice1".obs;
  var countryList = ["India", "UAE", "Saudi Arabia"].obs;
  var selectedCountry = "India".obs;
  var selectedCountryName = "India".obs;
  final RxString selectedTaxTreatmentText = '1'.obs;
  var taxId = "".obs;
  var taxTreatmentType = '1'.obs;
  void updateTaxTreatment(String value) {
    selectedTaxTreatmentText.value = value;
    taxId.value = value;

    taxTreatmentType.value =
        value == '1'
            ? 'Business to Customer (B2C)'
            : 'Business to Business (B2B)';
    log("treatment ${taxTreatmentType.value}");
  }

  var billwise = false.obs;
  var isactive = false.obs;
  var selectedParty = "CRM".obs;
  var partyidentificationList = ["CRM", "CRM1", "CRM2"].obs;

  //// opening database
  Future<void> openCustomerDatabase() async {
    database = await openDatabase(
      'customer.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE customer(id INTEGER PRIMARY KEY, customerCode TEXT,ledgerName TEXT,registeredName TEXT,registeredNameArabic TEXT,balance TEXT,type TEXT, selectedDate TEXT)',
        );
        await db.execute(
          'CREATE TABLE address(id INTEGER PRIMARY KEY,customerId INTEGER,label TEXT,buildingNumber TEXT,streetName TEXT,streetNameArabic TEXT,district TEXT, districtArabic TEXT, state TEXT,stateArabic TEXT,postalCode TEXT,country TEXT,FOREIGN KEY(customerId)REFERENCES customer(id) ON DELETE CASCADE)',
        );
        await db.execute(
          'CREATE TABLE phone(id INTEGER PRIMARY KEY,customerId INTEGER,type TEXT,phoneno TEXT, FOREIGN KEY(customerId)REFERENCES customer(id) ON DELETE CASCADE)',
        );

        await db.execute(
          'CREATE TABLE email(id INTEGER PRIMARY KEY,customerId INTEGER,type TEXT,Email TEXT, FOREIGN KEY(customerId)REFERENCES customer(id) ON DELETE CASCADE)',
        );

        await db.execute(
          'CREATE TABLE transactionData(id INTEGER PRIMARY KEY,customerId INTEGER,priceCategoryName TEXT,country TEXT,taxTreatment TEXT,taxNumber TEXT,creditPeriod TEXT,creditLimit TEXT, billWiseApplicable INTEGER, isActive INTEGER,partyIdentificationCode TEXT,idNo TEXT,salesDiscount TEXT,FOREIGN KEY(customerId)REFERENCES customer(id) ON DELETE CASCADE)',
        );

        await db.execute(
          'CREATE TABLE bank(id INTEGER PRIMARY KEY,customerId INTEGER,label TEXT,bankname TEXT,accountname TEXT,accountno TEXT,ifsccode TEXT,FOREIGN KEY(customerId)REFERENCES customer(id) ON DELETE CASCADE)',
        );
      },
    );
  }

  //// creating all customer details including address,phone,email,transaction,bank
  Future<void> addCompleteCustomerDetails(
    CustomerModel model,
    List<AddressModel> addressModel,
    List<PhoneModel> phoneModel,
    List<EmailModel> emailModel,
    List<TransactionModel> transactionModel,
    List<BankModel> bankModel,
  ) async {
    // await database.transaction((txn) async {
    int customerId = await database.rawInsert(
      'INSERT INTO customer(customerCode,ledgerName,registeredName,registeredNameArabic,balance,type,selectedDate)VALUES(?,?,?,?,?,?,?)',
      [
        model.customerCode,
        model.ledgerName,
        model.registeredName,
        model.registeredNameArabic,
        model.balance,
        model.type,
        model.selectedDate,
      ],
    );

    for (var address in addressModel) {
      await database.rawInsert(
        'INSERT INTO address(customerId,label,buildingNumber,streetName,streetNameArabic,district,districtArabic,state,stateArabic,postalCode,country)VALUES(?,?,?,?,?,?,?,?,?,?,?)',
        [
          customerId,
          address.label,
          address.buildingNumber,
          address.streetName,
          address.streetNameArabic,
          address.district,
          address.districtArabic,
          address.state,
          address.stateArabic,
          address.postalCode,
          address.country,
        ],
      );
    }

    for (var phone in phoneModel) {
      await database.rawInsert(
        'INSERT INTO phone(customerId,type,phoneno)VALUES(?,?,?)',
        [customerId, phone.type, phone.phoneno],
      );
    }

    for (var email in emailModel) {
      await database.rawInsert(
        'INSERT INTO email(customerId,type,Email)VALUES(?,?,?)',
        [customerId, email.type, email.Email],
      );
    }

    for (var transaction in transactionModel) {
      await database.rawInsert(
        'INSERT INTO transactionData(customerId,priceCategoryName,country,taxTreatment,taxNumber,creditPeriod,creditLimit,billWiseApplicable,isActive,partyIdentificationCode,idNo,salesDiscount)VALUES(?,?,?,?,?,?,?,?,?,?,?,?)',
        [
          customerId,
          transaction.priceCategoryName,
          transaction.country,
          transaction.taxTreatment,
          transaction.taxNumber,
          transaction.creditPeriod,
          transaction.creditLimit,
          transaction.billWiseApplicable,
          transaction.isActive,
          transaction.partyIdentificationCode,
          transaction.idNo,
          transaction.salesDiscount,
        ],
      );
    }

    for (var bank in bankModel) {
      await database.rawInsert(
        'INSERT INTO bank(customerId,label,bankname,accountname,accountno,ifsccode)VALUES(?,?,?,?,?,?)',
        [
          customerId,
          bank.label,
          bank.bankname,
          bank.accountname,
          bank.accountno,
          bank.ifsccode,
        ],
      );
    }
    // });


    List<CustomerModel> newData = await getCustomerList(
      limit: limit.value,
      offset: 0,
    );

    customer.value = newData;
    // getCustomerList();
    getAddressList();
    getPhoneList();
    getEmailList();
    getTransactionList();
    getBankList();
  }

  //// fetching all customers data
  Future<List<CustomerModel>> getCustomerList({int limit = 0,int offset = 0}) async {
    final data = await database.rawQuery('SELECT * FROM customer LIMIT ? OFFSET ?',
    [limit,offset]
    );
    print(data);
    
    return data.map((e) => CustomerModel.fromMap(e)).toList();
    
  }



  // Future<List<CountryModel>> getCountryList({
  //   int limit = 0,
  //   int offset = 0,
  // }) async {
  //   final data = await _database.rawQuery(
  //     'SELECT * FROM country LIMIT ? OFFSET ?',
  //     [limit, offset],
  //   );
  //   print(data);
  //   return data.map((e) => CountryModel.fromMap(e)).toList();
  // }


   Future<void> paginatedData() async {
    if (isloading.value) return;
    isloading.value = true;

    List<CustomerModel> newData = await getCustomerList(
      limit: limit.value,
      offset: 0,
    );

    customer.value = newData;

    isloading.value = false;
  }

  //// fetching customer data by ID and transaction data
  Future<void> getCustomerData(int customerId) async {
    final customerData = await database.rawQuery(
      'SELECT * FROM customer WHERE id = ?',
      [customerId],
    );
    if (customerData.isNotEmpty) {
      var customerModel = CustomerModel.fromMap(customerData.first);
      customerCode.text = customerModel.customerCode!;
      ledgernameController.text = customerModel.ledgerName!;
      registerednameController.text = customerModel.registeredName!;
      registerednameArabicController.text = customerModel.registeredNameArabic!;
      balance.text = customerModel.balance!;
      dropdownvalue.value = customerModel.type!;
      dateController.text = customerModel.selectedDate!;

      final transactionData = await database.rawQuery(
        'SELECT * FROM transactionData WHERE customerId = ?',
        [customerId],
      );
      if (transactionData.isNotEmpty) {
        var transactionModel = TransactionModel.fromMap(transactionData.first);
        selectedPriceCategory.value = transactionModel.priceCategoryName!;
        selectedCountryName.value = transactionModel.country!;
        taxTreatmentType.value = transactionModel.taxTreatment!;
        taxNoController.text = transactionModel.taxNumber!;
        creditPeriod.text = transactionModel.creditPeriod!;
        creditLimit.text = transactionModel.creditLimit!;
        billwise.value = transactionModel.billWiseApplicable!;
        isactive.value = transactionModel.isActive!;
        selectedParty.value = transactionModel.partyIdentificationCode!;
        idNo.text = transactionModel.idNo!;
        salesDiscount.text = transactionModel.salesDiscount!;
      }
    }
  }

  // //// fetching customer address data by customerId
  // Future<void> getAddressData(int customerId) async {
  //   addressData = await database.rawQuery(
  //     'SELECT * FROM address WHERE customerId = ?',
  //     [customerId],
  //   );
  //   if (addressData.isNotEmpty) {
  //     for (var data in addressData) {
  //       label.add(TextEditingController(text: data['label']));
  //       buildingNumber.add(TextEditingController(text: data['buildingNumber']));
  //       streetName.add(TextEditingController(text: data['streetName']));
  //       streetNameArabic.add(
  //         TextEditingController(text: data['streetNameArabic']),
  //       );
  //       district.add(TextEditingController(text: data['district']));
  //       districtArabic.add(TextEditingController(text: data['districtArabic']));
  //       state.add(TextEditingController(text: data['state']));
  //       stateArabic.add(TextEditingController(text: data['stateArabic']));
  //       postalCode.add(TextEditingController(text: data['postalCode']));
  //     }
  //   }
  // }

  // //// fetching customer mobile data by customerId

  // Future<void> getMobileData(int customerId) async {
  //   mobileData = await database.rawQuery(
  //     'SELECT  * FROM phone WHERE customerId = ?',
  //     [customerId],
  //   );

  //   if (mobileData.isNotEmpty) {
  //     //  phoneType.clear();
  //     //   phoneno.clear();

  //     for (var data in mobileData) {
  //       phoneType.add(TextEditingController(text: data['type']));
  //       phoneno.add(TextEditingController(text: data['phoneno']));
  //       // print('type:${data['type']}');
  //     }
  //   }
  // }

  // //// fetching customer email data by customerId

  // Future<void> getEmailData(int customerId) async {
  //   emailData = await database.rawQuery(
  //     'SELECT * FROM email WHERE customerId = ?',
  //     [customerId],
  //   );

  //   if (emailData.isNotEmpty) {
  //     for (var data in emailData) {
  //       emailType.add(TextEditingController(text: data['type']));
  //       Email.add(TextEditingController(text: data['Email']));
  //       // print('type:${data['type']}');
  //     }
  //   }
  // }

  // //// fetching customer bank data by customerId
  // Future<void> getBankData(int customerId) async {
  //   bankData = await database.rawQuery(
  //     'SELECT  * FROM bank WHERE customerId = ?',
  //     [customerId],
  //   );
  //   if (bankData.isNotEmpty) {
  //     for (var data in bankData) {
  //       bankLabel.add(TextEditingController(text: data['label']));
  //       bankname.add(TextEditingController(text: data['bankname']));
  //       accountname.add(TextEditingController(text: data['accountname']));
  //       accountno.add(TextEditingController(text: data['accountno']));
  //       ifsccode.add(TextEditingController(text: data['ifsccode']));
  //       districtArabic.add(TextEditingController(text: data['districtArabic']));
  //       state.add(TextEditingController(text: data['state']));
  //       stateArabic.add(TextEditingController(text: data['stateArabic']));
  //       postalCode.add(TextEditingController(text: data['postalCode']));
  //     }
  //   }
  // }

  //// fetching all address data
  Future<void> getAddressList() async {
    final data = await database.rawQuery('SELECT * FROM address');
    print(data);
    address.value = data.map((e) => AddressModel.fromMap(e)).toList();
  }

  //// fetching all phone data
  Future<void> getPhoneList() async {
    final data = await database.rawQuery('SELECT * FROM phone');
    print(data);
    phone.value = data.map((e) => PhoneModel.fromMap(e)).toList();
  }

  //// fetching all email data
  Future<void> getEmailList() async {
    final data = await database.rawQuery('SELECT * FROM email');
    print(data);
    email.value = data.map((e) => EmailModel.fromMap(e)).toList();
  }

  //// fetching all transaction data
  Future<void> getTransactionList() async {
    final data = await database.rawQuery('SELECT * FROM transactionData');
    print(data);
    transaction.value = data.map((e) => TransactionModel.fromMap(e)).toList();
  }

  //// fetching all bank data
  Future<void> getBankList() async {
    final data = await database.rawQuery('SELECT * FROM bank');
    print(data);
    bank.value = data.map((e) => BankModel.fromMap(e)).toList();
  }

  //// editing all customer details including address,phone,email,transaction,bank
  Future<void> editCustomer(
    CustomerModel customerData,
    List<AddressModel> addressModel,
    List<PhoneModel> phoneModel,
    List<EmailModel> emailModel,
    List<TransactionModel> transactionModel,
    List<BankModel> bankModel,
  ) async {
    // await database.transaction((txn) async {
    await database.rawUpdate(
      'UPDATE customer SET customerCode=?, ledgerName=?, registeredName=?, registeredNameArabic=?, balance=?, type=?, selectedDate=? WHERE id=?',
      [
        customerData.customerCode,
        customerData.ledgerName,
        customerData.registeredName,
        customerData.registeredNameArabic,
        customerData.balance,
        customerData.type,
        customerData.selectedDate,
        customerData.id,
      ],
    );

    await database.rawDelete('DELETE FROM address WHERE customerId=?', [
      customerData.id,
    ]);
    await database.rawDelete('DELETE FROM phone WHERE customerId=?', [
      customerData.id,
    ]);
    await database.rawDelete('DELETE FROM email WHERE customerId=?', [
      customerData.id,
    ]);
    await database.rawDelete('DELETE FROM transactionData WHERE customerId=?', [
      customerData.id,
    ]);
    await database.rawDelete('DELETE FROM bank WHERE customerId=?', [
      customerData.id,
    ]);

    for (var address in addressModel) {
      await database.rawInsert(
        'INSERT INTO address(customerId, label, buildingNumber, streetName, streetNameArabic, district, districtArabic, state, stateArabic, postalCode, country) VALUES(?,?,?,?,?,?,?,?,?,?,?)',
        [
          customerData.id,
          address.label,
          address.buildingNumber,
          address.streetName,
          address.streetNameArabic,
          address.district,
          address.districtArabic,
          address.state,
          address.stateArabic,
          address.postalCode,
          address.country,
        ],
      );
    }

    for (var phone in phoneModel) {
      await database.rawInsert(
        'INSERT INTO phone(customerId, type, phoneno) VALUES(?,?,?)',
        [customerData.id, phone.type, phone.phoneno],
      );
    }

    for (var email in emailModel) {
      await database.rawInsert(
        'INSERT INTO email(customerId, type, Email) VALUES(?,?,?)',
        [customerData.id, email.type, email.Email],
      );
    }

    for (var transaction in transactionModel) {
      await database.rawInsert(
        'INSERT INTO transactionData(customerId, priceCategoryName, country, taxTreatment, taxNumber, creditPeriod, creditLimit, billWiseApplicable, isActive, partyIdentificationCode, idNo, salesDiscount) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)',
        [
          customerData.id,
          transaction.priceCategoryName,
          transaction.country,
          transaction.taxTreatment,
          transaction.taxNumber,
          transaction.creditPeriod,
          transaction.creditLimit,
          transaction.billWiseApplicable,
          transaction.isActive,
          transaction.partyIdentificationCode,
          transaction.idNo,
          transaction.salesDiscount,
        ],
      );
    }

    for (var bank in bankModel) {
      await database.rawInsert(
        'INSERT INTO bank(customerId, label, bankname, accountname, accountno, ifsccode) VALUES(?,?,?,?,?,?)',
        [
          customerData.id,
          bank.label,
          bank.bankname,
          bank.accountname,
          bank.accountno,
          bank.ifsccode,
        ],
      );
    }
    // });


     List<CustomerModel> newData = await getCustomerList(
      limit: limit.value,
      offset: 0,
    );

    customer.value = newData;
    // getCustomerList();
    getAddressList();
    getPhoneList();
    getEmailList();
    getTransactionList();
    getBankList();
  }

  // Future<void> deleteCustomer(CustomerModel customer) async {
  //   await database.rawDelete('DELETE FROM customer WHERE id = ?', [
  //     customer.id
  //   ]);
  //   getCustomerList();
  // }

  //// delete a customer
  Future<void> deleteCustomer(CustomerModel customerData) async {
    await database.transaction((txn) async {
      final customerId = customerData.id;

      await txn.rawDelete('DELETE FROM address WHERE customerId = ?', [
        customerId,
      ]);
      await txn.rawDelete('DELETE FROM phone WHERE customerId = ?', [
        customerId,
      ]);
      await txn.rawDelete('DELETE FROM email WHERE customerId = ?', [
        customerId,
      ]);
      await txn.rawDelete('DELETE FROM transactionData WHERE customerId = ?', [
        customerId,
      ]);
      await txn.rawDelete('DELETE FROM bank WHERE customerId = ?', [
        customerId,
      ]);
      await txn.rawDelete('DELETE FROM customer WHERE id = ?', [customerId]);
    });
   
     List<CustomerModel> newData = await getCustomerList(
      limit: limit.value,
      offset: 0,
    );

    customer.value = newData;
    // getCustomerList();
    getAddressList();
    getPhoneList();
    getEmailList();
    getTransactionList();
    getBankList();
  }

void _onScrollListner(){
if(scrollController.position.atEdge){
  if(scrollController.position.pixels !=0){
    isloading.value = true;
    offset.value ++;
    getPaginatedData(offsetValue: offset.value, limit: limit.value).then((value) {
      customer.addAll(value);
      isloading.value = false;
    },);
  }
}
}

Future<List<CustomerModel>> getPaginatedData({required int offsetValue,required int limit})async{
int offset = limit*offsetValue;

final data = await database.rawQuery( 'SELECT * FROM customer ORDER BY id ASC LIMIT ? OFFSET ?',
      [limit, offset],);

      return data.map((e) => CustomerModel.fromMap(e)).toList();
}

}
