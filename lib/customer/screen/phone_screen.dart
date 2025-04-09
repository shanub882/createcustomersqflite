import 'package:customerdata_sqflite/customer/controller/customerController.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';
import 'package:customerdata_sqflite/customer/model/phone_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneContainer extends StatefulWidget {
  final int index;
  final VoidCallback onRemove;
  final PhoneModel phoneModel;

  const PhoneContainer({
    super.key,
    required this.index,
    required this.onRemove,
    required this.phoneModel,
  });

  @override
  State<PhoneContainer> createState() => _PhoneContainerState();
}

class _PhoneContainerState extends State<PhoneContainer> {
  CustomerController customerController = Get.put(CustomerController());

  final FocusNode phoneTypeFocus = FocusNode();
  final FocusNode phoneNumberFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // var phonelist = customerController.phoneList[widget.index];
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        focusNode: phoneTypeFocus,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(phoneNumberFocus);
                        },
                        // controller: customerController.phoneType[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.phoneModel.type,
                        onChanged: (value) {
                          widget.phoneModel.type = value;
                          customerController.updatePhone(widget.phoneModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(hintText: 'Type'),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.04),
                    Expanded(
                      child: TextFormField(
                        focusNode: phoneNumberFocus,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(ledgerNameFocus);
                        // },
                        // controller: customerController.phoneno[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.phoneModel.phoneno,
                        onChanged: (value) {
                          widget.phoneModel.phoneno = value;
                          customerController.updatePhone(widget.phoneModel);
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
                        decoration: newDesignTextfield(hintText: 'Phone No'),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: widget.onRemove,
                          icon: Icon(Icons.close, color: Colors.red),
                        ),
                      ],
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
