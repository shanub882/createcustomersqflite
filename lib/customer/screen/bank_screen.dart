
import 'package:customerdata_sqflite/customer/controller/customerController.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';
import 'package:customerdata_sqflite/customer/model/bank_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BankContainer extends StatefulWidget {
 
  final int index;
  final VoidCallback onRemove;
  final BankModel bankModel;

  const BankContainer({super.key, required this.index, required this.onRemove,required this.bankModel});

  @override
  State<BankContainer> createState() => _BankContainerState();
}

class _BankContainerState extends State<BankContainer> {
  CustomerController customerController = Get.put(CustomerController());

  
  final FocusNode bankLabelFocus = FocusNode();
  final FocusNode bankNameFocus = FocusNode();
    final FocusNode accountNameFocus = FocusNode();
    final FocusNode accountNumberFocus = FocusNode();
    final FocusNode ifscFocus = FocusNode();

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
                            focusNode: bankLabelFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(bankNameFocus);
                            },
                            // controller: customerController.bankLabel[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            initialValue: widget.bankModel.label,
                            onChanged: (value) {
                              widget.bankModel.label = value;
                              customerController.updateBank(
                                  widget.bankModel);
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
                            focusNode: bankNameFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(accountNameFocus);
                            },
                            // controller: customerController.bankname[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            initialValue: widget.bankModel.bankname,
                            onChanged: (value) {
                              widget.bankModel.bankname = value;
                              customerController.updateBank(
                                  widget.bankModel);
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
                            focusNode: accountNameFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(accountNumberFocus);
                            },
                            // controller: customerController.accountname[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            initialValue: widget.bankModel.accountname,
                            onChanged: (value) {
                              widget.bankModel.accountname = value;
                               customerController.updateBank(
                                  widget.bankModel);
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
                            focusNode: accountNumberFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(ifscFocus);
                            },
                            // controller: customerController.accountno[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            initialValue: widget.bankModel.accountno,
                            onChanged: (value) {
                              widget.bankModel.accountno = value;
                              customerController.updateBank(
                                  widget.bankModel);
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
                            focusNode: ifscFocus,
                         
                            // controller: customerController.ifsccode[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            initialValue: widget.bankModel.ifsccode,
                            onChanged: (value) {
                              widget.bankModel.ifsccode = value;
                              customerController.updateBank(
                                  widget.bankModel,);
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
