import 'package:customerdata_sqflite/customer/controller/customerController.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';
import 'package:customerdata_sqflite/customer/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressContainer extends StatefulWidget {
  final int index;
  final AddressModel addressModel;
  final VoidCallback onRemove;

  const AddressContainer({
    super.key,
    required this.index,
    required this.onRemove,
    required this.addressModel,
  });

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  CustomerController customerController = Get.put(CustomerController());

  final FocusNode labelFocus = FocusNode();
  final FocusNode buildingNumberFocus = FocusNode();
  final FocusNode streetNameFocus = FocusNode();
  final FocusNode streetNameArabicFocus = FocusNode();
  final FocusNode districtNameFocus = FocusNode();
  final FocusNode districtNameArabicFocus = FocusNode();
  final FocusNode stateNameFocus = FocusNode();
  final FocusNode stateNameArabicFocus = FocusNode();
  final FocusNode postalCodeFocus = FocusNode();

  @override
  void initState() {
    if (widget.addressModel.country.isNotEmpty) {
    customerController.selectedCountry.value = widget.addressModel.country;
  }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // var addresslist = customerController.address[widget.index];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () async {}, icon: Icon(Icons.add)),
                IconButton(
                  onPressed: widget.onRemove,
                  icon: Icon(Icons.close, color: Colors.red),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        focusNode: labelFocus,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(buildingNumberFocus);
                        },
                        // controller: customerController.label[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.addressModel.label,
                        onChanged: (value) {
                          widget.addressModel.label = value;
                          customerController.updateAddress(widget.addressModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(hintText: 'Label'),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    Expanded(
                      child: TextFormField(
                        focusNode: buildingNumberFocus,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(streetNameFocus);
                        },
                        // controller:
                        //     customerController.buildingNumber[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.addressModel.buildingNumber,
                      
                          onChanged: (value) {
                          widget.addressModel.buildingNumber = value;
                          customerController.updateAddress(widget.addressModel);
                      
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,8}'),
                          ),
                        ],
                        decoration: newDesignTextfield(
                          hintText: 'Building Number',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        focusNode: streetNameFocus,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(streetNameArabicFocus);
                        },
                        // controller: customerController.streetName[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.addressModel.streetName,
                        onChanged: (value) {
                          widget.addressModel.streetName = value;
                          customerController.updateAddress(widget.addressModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(hintText: 'Street Name'),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    Expanded(
                      child: TextFormField(
                        focusNode: streetNameArabicFocus,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(districtNameFocus);
                        },
                        // controller:
                        //     customerController.streetNameArabic[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                       initialValue: widget.addressModel.streetNameArabic,
                      onChanged: (value) {
                          widget.addressModel.streetNameArabic = value;
                          customerController.updateAddress(widget.addressModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(
                          hintText: 'Street Name (Arabic)',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        focusNode: districtNameFocus,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(districtNameArabicFocus);
                        },
                        // controller: customerController.district[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                       initialValue: widget.addressModel.district,
                        onChanged: (value) {
                          widget.addressModel.district = value;
                          customerController.updateAddress(widget.addressModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(
                          hintText: 'District or City Subdivision',
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    Expanded(
                      child: TextFormField(
                        focusNode: districtNameArabicFocus,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(stateNameFocus);
                        },
                        // controller:
                        //     customerController.districtArabic[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                       initialValue: widget.addressModel.districtArabic,
                         onChanged: (value) {
                          widget.addressModel.districtArabic = value;
                          customerController.updateAddress(widget.addressModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(
                          hintText: 'District or City Subdivision (Arabic)',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        focusNode: stateNameFocus,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(stateNameArabicFocus);
                        },
                        // controller: customerController.state[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.addressModel.state,
                        onChanged: (value) {
                          widget.addressModel.state = value;
                          customerController.updateAddress(widget.addressModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(
                          hintText: 'State or Province',
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    Expanded(
                      child: TextFormField(
                        focusNode: stateNameArabicFocus,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(postalCodeFocus);
                        },
                        // controller:
                        // customerController.stateArabic[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.addressModel.stateArabic,
                       onChanged: (value) {
                          widget.addressModel.stateArabic = value;
                          customerController.updateAddress(widget.addressModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(
                          hintText: 'State or Province (Arabic)',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        focusNode: postalCodeFocus,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(ledgerNameFocus);
                        // },
                        // controller: customerController.postalCode[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,8}'),
                          ),
                        ],
                        initialValue: widget.addressModel.postalCode,
                      onChanged: (value) {
                          widget.addressModel.postalCode = value;
                          customerController.updateAddress(widget.addressModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(hintText: 'Postal Code'),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.02),
                    Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFFFFFFF)),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                        value: widget.addressModel.country.isEmpty
                            ? null
                            : widget.addressModel.country,
                        dropdownColor: Color(0xFF004775),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xFFFFFFFF),
                        ),
                        items: customerController.countryname.map((country) {
                          return DropdownMenuItem<String>(
                            value: country,
                            child: Text(
                              country,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              widget.addressModel.country = value;
                              customerController
                                  .updateAddress(widget.addressModel);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
