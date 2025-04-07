

import 'package:customerdata_sqflite/customer/controller/customer_controller.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressContainer extends StatefulWidget {
  
  final int index;
  final VoidCallback onRemove;

  const AddressContainer(
      {super.key, required this.index, required this.onRemove});

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
        // var addresslist = customerController.addressList[widget.index];
        return  Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () async {
                         
                          },
                          icon: Icon(Icons.add)),
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
                              controller: customerController.label[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: addresslist.label,
                              onChanged: (value) {
                                // addresslist.label = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              decoration: newDesignTextfield(
                                hintText: 'Label',
                              ),
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Expanded(
                            child: TextFormField(
                              controller: customerController.buildingNumber[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: addresslist.buildingNumber,
                              onChanged: (value) {
                                // addresslist.buildingNumber = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,8}')),
                              ],
                              decoration: newDesignTextfield(
                                hintText: 'Building Number',
                              ),
                            ),
                          ),
                        ],
                      )
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
                              controller: customerController.streetName[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: addresslist.streetName,
                              onChanged: (value) {
                                // addresslist.streetName = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              decoration: newDesignTextfield(
                                hintText: 'Street Name',
                              ),
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Expanded(
                            child: TextFormField(
                              controller: customerController.streetNameArabic[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: addresslist.streetNameArabic,
                              onChanged: (value) {
                                // addresslist.streetNameArabic = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
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
                              controller: customerController.district[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: addresslist.district,
                              onChanged: (value) {
                                // addresslist.district = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              decoration: newDesignTextfield(
                                hintText: 'District or City Subdivision',
                              ),
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Expanded(
                            child: TextFormField(
                               controller: customerController.districtArabic[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: addresslist.districtArabic,
                              onChanged: (value) {
                                // addresslist.districtArabic = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              decoration: newDesignTextfield(
                                hintText: 'District or City Subdivision (Arabic)',
                              ),
                            ),
                          ),
                        ],
                      )
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
                               controller: customerController.state[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: addresslist.state,
                              onChanged: (value) {
                                // addresslist.state = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              decoration: newDesignTextfield(
                                hintText: 'State or Province',
                              ),
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Expanded(
                            child: TextFormField(
                               controller: customerController.stateArabic[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: addresslist.stateArabic,
                              onChanged: (value) {
                                // addresslist.stateArabic = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              decoration: newDesignTextfield(
                                hintText: 'State or Province (Arabic)',
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                               controller: customerController.postalCode[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,8}')),
                              ],
                              // initialValue: addresslist.postalCode,
                              onChanged: (value) {
                                // addresslist.postalCode = value;
                                // customerController.updateAddress(
                                //     widget.index, addresslist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              decoration: newDesignTextfield(
                                hintText: 'Postal Code',
                              ),
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Expanded(
                            child: Container(
                              width: screenSize.width,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFFFFFFF)),
                                ),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DropdownButtonHideUnderline(
                                child: Obx(() {
                                  return DropdownButton<String>(
                  isExpanded: true,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.0),
                  value: customerController.selectedCountry.value.isEmpty
                      ? null
                      : customerController.selectedCountry.value, 
                  dropdownColor: Color(0xFF004775),
                  icon: Icon(Icons.arrow_drop_down, color: Color(0xFFFFFFFF)),
                  items: customerController.countryname.map((country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(
                        country,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.0),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                  
                      customerController.selectedCountry.value = value;
                    }
                  },
                );
                                  }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        
       
    
  }
}
