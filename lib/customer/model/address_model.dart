class AddressModel {
  int id;
  String label;
  String buildingNumber;
  String streetName;
  String streetNameArabic;
  String district;
  String districtArabic;
  String city;
  String cityArabic;
  String postalCode;
  String state;
  String stateArabic;
  String country;
  int customerId;

  AddressModel({
    this.id=0,
    this.label = '',
    this.buildingNumber = '',
    this.streetName = '',
    this.streetNameArabic = '',
    this.district = '',
    this.districtArabic = '',
    this.city = '',
    this.cityArabic = '',
    this.postalCode = '',
    this.state = '',
    this.stateArabic = '',
    this.country = 'India',
    this.customerId=0
  });


  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'buildingNumber': buildingNumber,
      'streetName': streetName,
      'streetNameArabic': streetNameArabic,
      'district': district,
      'districtArabic': districtArabic,
      'city': city,
      'cityArabic': cityArabic,
      'postalCode': postalCode,
      'state': state,
      'stateArabic': stateArabic,
        'country': country,
        'customerId': customerId
    };
  }

   factory AddressModel.fromMap(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      label: json['label'].toString(),
      buildingNumber: json['buildingNumber'].toString(),
      streetName: json['streetName'].toString(),
      streetNameArabic: json['streetNameArabic'].toString(),
      district: json['district'].toString(),
      districtArabic: json['districtArabic'].toString(),
      city: json['city'].toString(),
      cityArabic: json['cityArabic'].toString(),
      postalCode: json['postalCode'].toString(),
      state: json['state'].toString(),
      stateArabic: json['stateArabic'].toString(),
      country: json['country'].toString(),
      customerId: json['customerId']
    );
  }



}
