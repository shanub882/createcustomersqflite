
import 'package:customerdata_sqflite/customer/controller/customer_controller.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BankContainer extends StatefulWidget {
 
  final int index;
  final VoidCallback onRemove;

  const BankContainer({super.key, required this.index, required this.onRemove});

  @override
  State<BankContainer> createState() => _BankContainerState();
}

class _BankContainerState extends State<BankContainer> {
  CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
   
        // var banklist = customerController.bankList[widget.index];
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
                          // customerController.printBankList();
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
                            controller: customerController.bankLabel[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            // initialValue: banklist.label,
                            onChanged: (value) {
                              // banklist.label = value;
                              // customerController.updateBank(
                              //     widget.index, banklist);
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
                            controller: customerController.bankname[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            // initialValue: banklist.bankname,
                            onChanged: (value) {
                              // banklist.bankname = value;
                              // customerController.updateBank(
                              //     widget.index, banklist);
                            },
                            style: customiseStyle(
                                const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                            decoration: newDesignTextfield(
                              hintText: 'Bank Name',
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
                            controller: customerController.accountname[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            // initialValue: banklist.accountname,
                            onChanged: (value) {
                              // banklist.accountname = value;
                              // customerController.updateBank(
                              //     widget.index, banklist);
                            },
                            style: customiseStyle(
                                const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                            decoration: newDesignTextfield(
                              hintText: 'Account Name',
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        Expanded(
                          child: TextFormField(
                            controller: customerController.accountno[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            // initialValue: banklist.accountno,
                            onChanged: (value) {
                              // banklist.accountno = value;
                              // customerController.updateBank(
                              //     widget.index, banklist);
                            },
                            style: customiseStyle(
                                const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                            decoration: newDesignTextfield(
                              hintText: 'Account Number',
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,8}')),
                            ],
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
                            controller: customerController.ifsccode[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            // initialValue: banklist.ifsccode,
                            onChanged: (value) {
                              // banklist.ifsccode = value;
                              // customerController.updateBank(
                              //     widget.index, banklist);
                            },
                            style: customiseStyle(
                                const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                            decoration: newDesignTextfield(
                              hintText: 'IBAN/IFSC Code',
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
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
