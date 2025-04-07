

import 'package:customerdata_sqflite/customer/controller/customer_controller.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailContainer extends StatefulWidget {
  final int index;
  final VoidCallback onRemove;

  const EmailContainer(
      {super.key, required this.index, required this.onRemove});

  @override
  State<EmailContainer> createState() => _EmailContainerState();
}

class _EmailContainerState extends State<EmailContainer> {
  CustomerController customerController = Get.put(CustomerController());


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
   
        // var emaillist = customerController.emailList[widget.index];
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
                          // customerController.printemailList();
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
                            controller: customerController.emailType[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            // initialValue: emaillist.type,
                            onChanged: (value) {
                              // emaillist.type = value;
                              // customerController.updateEmail(
                              //     widget.index, emaillist);
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
                            controller: customerController.Email[widget.index],
                            cursorColor: Color(0xFFFFFFFF),
                            // initialValue: emaillist.Email,
                            onChanged: (value) {
                              // emaillist.Email = value;
                              // customerController.updateEmail(
                              //     widget.index, emaillist);
                            },
                            style: customiseStyle(
                                const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                            decoration: newDesignTextfield(
                              hintText: 'Email',
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
}
