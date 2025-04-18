import 'package:customerdata_sqflite/customer/controller/customerController.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';
import 'package:customerdata_sqflite/customer/model/email_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailContainer extends StatefulWidget {
  final int index;
  final VoidCallback onRemove;
  final EmailModel emailModel;

  const EmailContainer({
    super.key,
    required this.index,
    required this.onRemove,
    required this.emailModel,
  });

  @override
  State<EmailContainer> createState() => _EmailContainerState();
}

class _EmailContainerState extends State<EmailContainer> {
  CustomerController customerController = Get.put(CustomerController());

  final FocusNode emailTypeFocus = FocusNode();
  final FocusNode emailAddressFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // var emaillist = customerController.emailList[widget.index];
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
                        focusNode: emailTypeFocus,
                        onEditingComplete: () {
                          FocusScope.of(
                            context,
                          ).requestFocus(emailAddressFocus);
                        },
                        // controller: customerController.emailType[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.emailModel.type,
                        onChanged: (value) {
                          widget.emailModel.type = value;
                          customerController.updateEmail(widget.emailModel);
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
                        focusNode: emailAddressFocus,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(ledgerNameFocus);
                        // },
                        // controller: customerController.Email[widget.index],
                        cursorColor: Color(0xFFFFFFFF),
                        initialValue: widget.emailModel.Email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!RegExp(
                            r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                          ).hasMatch(value!.trim())) {
                            return 'Please Enter a\nValid Email';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        //  inputFormatters: [
                        //     FilteringTextInputFormatter.allow(
                        //         RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")),
                        //   ],
                        onChanged: (value) {
                          widget.emailModel.Email = value;
                          customerController.updateEmail(widget.emailModel);
                        },
                        style: customiseStyle(
                          const Color(0xFFFFFFFF),
                          FontWeight.w500,
                          14.0,
                        ),
                        decoration: newDesignTextfield(hintText: 'Email'),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.01),
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
      ),
    );
  }
}
