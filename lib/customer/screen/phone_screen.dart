

import 'package:customerdata_sqflite/customer/controller/customer_controller.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneContainer extends StatefulWidget {

  final int index;
  final VoidCallback onRemove;

  const PhoneContainer(
      {super.key, required this.index, required this.onRemove});

  @override
  State<PhoneContainer> createState() => _PhoneContainerState();
}

class _PhoneContainerState extends State<PhoneContainer> {
  CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
        
        return Obx(
          () {
            // var phonelist = customerController.phoneList[widget.index];
            return Container(
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
                          onPressed: () {
                            // customerController.printphoneList();
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
                              controller: customerController.phoneType[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: phonelist.type,
                              onChanged: (value) {
                                // phonelist.type = value;
                                // customerController.updatePhone(
                                //     widget.index, phonelist);
                              },
                              style: customiseStyle(
                                  const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                              decoration: newDesignTextfield(
                                hintText: 'Type',
                              ),
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Expanded(
                            child: TextFormField(
                              controller: customerController.phoneno[widget.index],
                              cursorColor: Color(0xFFFFFFFF),
                              // initialValue: phonelist.phoneno,
                              onChanged: (value) {
                                // phonelist.phoneno = value;
                                // customerController.updatePhone(
                                //     widget.index, phonelist);
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
                                hintText: 'Phone No',
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        
          }
         );
    
  }
}
