import 'dart:developer';

import 'package:customerdata_sqflite/customer/controller/customer_controller.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';
import 'package:customerdata_sqflite/customer/model/address_model.dart';
import 'package:customerdata_sqflite/customer/model/bank_model.dart';
import 'package:customerdata_sqflite/customer/model/customer_model.dart';
import 'package:customerdata_sqflite/customer/model/email_model.dart';
import 'package:customerdata_sqflite/customer/model/phone_model.dart';
import 'package:customerdata_sqflite/customer/model/transaction_model.dart';
import 'package:customerdata_sqflite/customer/screen/address_screen.dart';
import 'package:customerdata_sqflite/customer/screen/bank_screen.dart';
import 'package:customerdata_sqflite/customer/screen/email_screen.dart';
import 'package:customerdata_sqflite/customer/screen/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateCustomerScreen extends StatefulWidget {
  final bool edit;
  final int customerId;

  const CreateCustomerScreen({
    super.key,
    required this.edit,
    required this.customerId,
  });

  @override
  State<CreateCustomerScreen> createState() => _CreateCustomerScreenState();
}

class _CreateCustomerScreenState extends State<CreateCustomerScreen> {
  CustomerController customerController = Get.put(CustomerController());

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.edit) {
      customerController.getCustomerData(widget.customerId);
      customerController.getAddressData(widget.customerId);
      customerController.getMobileData(widget.customerId);
      customerController.getEmailData(widget.customerId);
      customerController.getBankData(widget.customerId);
    }

    super.initState();
  }

  final FocusNode customercodeFocus = FocusNode();
  final FocusNode ledgerNameFocus = FocusNode();
    final FocusNode registeredNameFocus = FocusNode();
    final FocusNode registerednameArabicFocus = FocusNode();
    final FocusNode balanceFocus = FocusNode();
    // final FocusNode dropdownFocus = FocusNode();
    // final FocusNode selectDateFocus = FocusNode();
    final FocusNode creditPeriodFocus = FocusNode();
    final FocusNode creditLimitFocus = FocusNode();
    final FocusNode idNoFocus = FocusNode();
    final FocusNode salesDiscountFocus = FocusNode();
    

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xFF000000),
        title: Text(
          widget.edit ? "Edit Customer" : "Create Customer",
          style: customiseStyle(const Color(0xFFFFFFFF), FontWeight.bold, 18.0),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF212121),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            focusNode: customercodeFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(ledgerNameFocus);
                            },
                            controller: customerController.customerCode,
                            cursorColor: Color(0xFFFFFFFF),
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
                              hintText: 'Customer Code',
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          TextFormField(
                             focusNode: ledgerNameFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(registeredNameFocus);
                            },
                            controller: customerController.ledgernameController,
                            cursorColor: Color(0xFFFFFFFF),
                            style: customiseStyle(
                              const Color(0xFFFFFFFF),
                              FontWeight.w500,
                              14.0,
                            ),
                            decoration: newDesignTextfield(
                              hintText: 'Ledger Name',
                            ),
                            onChanged: (value) {
                              // customerController.registerednameController.text =
                              //     value;
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          TextFormField(
                              focusNode: registeredNameFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(registerednameArabicFocus);
                            },
                            controller:
                                customerController.registerednameController,
                            cursorColor: Color(0xFFFFFFFF),
                            style: customiseStyle(
                              const Color(0xFFFFFFFF),
                              FontWeight.w500,
                              14.0,
                            ),
                            decoration: newDesignTextfield(
                              hintText: 'Registered Name',
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          TextFormField(
                            focusNode: registerednameArabicFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(balanceFocus);
                            },
                            controller:
                                customerController
                                    .registerednameArabicController,
                            cursorColor: Color(0xFFFFFFFF),
                            style: customiseStyle(
                              const Color(0xFFFFFFFF),
                              FontWeight.w500,
                              14.0,
                            ),
                            decoration: newDesignTextfield(
                              hintText: 'Registered Name (Arabic)',
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          TextFormField(
                            focusNode: balanceFocus,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(dropdownFocus);
                            // },
                            controller: customerController.balance,
                            cursorColor: Color(0xFFFFFFFF),
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
                            decoration: newDesignTextfield(hintText: 'Balance'),
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Container(
                            width: screenSize.width,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Color(0xFFFFFFFF)),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Obx(() {
                                return DropdownButton<String>(
                                  // focusNode: dropdownFocus,
                          
                                  isExpanded: true,
                                  style: customiseStyle(
                                    const Color(0xFFFFFFFF),
                                    FontWeight.w500,
                                    14.0,
                                  ),
                                  value:
                                      customerController
                                              .dropdownvalue
                                              .value
                                              .isEmpty
                                          ? null
                                          : customerController
                                              .dropdownvalue
                                              .value,
                                  dropdownColor: const Color(0xFF004775),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  items:
                                      customerController.items.map((item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: customiseStyle(
                                              const Color(0xFFFFFFFF),
                                              FontWeight.w500,
                                              14.0,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      customerController.dropdownvalue.value =
                                          value;
                                    }
                                    
                                  },
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );

                              if (pickedDate != null) {
                                customerController.dateController.text =
                                    "${pickedDate.toLocal()}".split(' ')[0];
                              }
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                              
                                readOnly: true,
                                controller: customerController.dateController,
                                cursorColor: Color(0xFFFFFFFF),
                                style: customiseStyle(
                                  const Color(0xFFFFFFFF),
                                  FontWeight.w500,
                                  14.0,
                                ),
                                decoration: newDesignTextfield(
                                  hintText: 'Select Date',
                                  suffixIcon: Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                //!Contact
                                "Contact Details",
                                style: customiseStyle(
                                  const Color(0xFFFFFFFF),
                                  FontWeight.bold,
                                  16.0,
                                ),
                              ),
                              Obx(() {
                                return Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                    activeColor: Colors.grey,
                                    thumbColor: WidgetStateProperty.all(
                                      Colors.white,
                                    ),
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: const Color(0xFF212121),
                                    activeTrackColor: Color(0xFF004775),
                                    value:
                                        customerController.ismorecontact.value,
                                    onChanged: (value) async {
                                      customerController.ismorecontact.value =
                                          !customerController
                                              .ismorecontact
                                              .value;
                                    },
                                  ),
                                );
                              }),
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.01),
                          Obx(
                            () =>
                                customerController.ismorecontact.value
                                    ? Column(
                                      children: [
                                        Column(
                                          //!address
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Address",
                                                  style: customiseStyle(
                                                    const Color(0xFFFFFFFF),
                                                    FontWeight.bold,
                                                    14.0,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    customerController
                                                        .addAddress();
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Color(
                                                          0xFF10C103,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Add New",
                                                        style: customiseStyle(
                                                          const Color(
                                                            0xFF10C103,
                                                          ),
                                                          FontWeight.bold,
                                                          14.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            widget.edit == true &&
                                                    customerController
                                                        .address
                                                        .isNotEmpty
                                                ? Obx(() {
                                                  return ListView.separated(
                                                    separatorBuilder: (
                                                      context,
                                                      index,
                                                    ) {
                                                      return Divider(
                                                        color:
                                                            Colors.transparent,
                                                      );
                                                    },
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        customerController
                                                            .address
                                                            .length,
                                                    itemBuilder: (
                                                      context,
                                                      index,
                                                    ) {
                                                      return AddressContainer(
                                                        index: index,
                                                        onRemove:
                                                            () => customerController
                                                                .removeAddress(
                                                                  index,
                                                                ),
                                                      );
                                                    },
                                                  );
                                                })
                                                : SizedBox(),
                                            Obx(
                                              () => ListView.separated(
                                                separatorBuilder: (
                                                  context,
                                                  index,
                                                ) {
                                                  return Divider(
                                                    color: Colors.transparent,
                                                  );
                                                },
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    customerController
                                                        .addressList
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  return AddressContainer(
                                                    index: index,
                                                    onRemove:
                                                        () => customerController
                                                            .removeAddress(
                                                              index,
                                                            ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenSize.height * 0.01,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          //!phone
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Phone",
                                                  style: customiseStyle(
                                                    const Color(0xFFFFFFFF),
                                                    FontWeight.bold,
                                                    14.0,
                                                  ),
                                                ),

                                                GestureDetector(
                                                  onTap: () {
                                                    print(
                                                      'phoneList1.length ${customerController.phoneList.length}',
                                                    );
                                                    customerController
                                                        .addPhone();
                                                    print(
                                                      'phoneList2.length ${customerController.phoneList.length}',
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Color(
                                                          0xFF10C103,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Add New",
                                                        style: customiseStyle(
                                                          const Color(
                                                            0xFF10C103,
                                                          ),
                                                          FontWeight.bold,
                                                          14.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: screenSize.height * 0.01,
                                            ),
                                            Obx(
                                              () => ListView.separated(
                                                separatorBuilder: (
                                                  context,
                                                  index,
                                                ) {
                                                  return Divider(
                                                    color: Colors.transparent,
                                                  );
                                                },
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    customerController
                                                        .phoneList
                                                        .length,

                                                itemBuilder: (context, index) {
                                                  return
                                                  // CustomContainer(
                                                  //  no:customerController.phoneno[index].text,
                                                  //  type: customerController.phoneType[index].text,
                                                  // ) ;
                                                  PhoneContainer(
                                                    index: index,
                                                    onRemove:
                                                        () => customerController
                                                            .removePhone(index),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          //!email
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Email",
                                                  style: customiseStyle(
                                                    const Color(0xFFFFFFFF),
                                                    FontWeight.bold,
                                                    14.0,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    customerController
                                                        .addemail();
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Color(
                                                          0xFF10C103,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Add New",
                                                        style: customiseStyle(
                                                          const Color(
                                                            0xFF10C103,
                                                          ),
                                                          FontWeight.bold,
                                                          14.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: screenSize.height * 0.01,
                                            ),
                                            Obx(
                                              () => ListView.separated(
                                                separatorBuilder: (
                                                  context,
                                                  index,
                                                ) {
                                                  return Divider(
                                                    color: Colors.transparent,
                                                  );
                                                },
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    customerController
                                                        .emailList
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  return EmailContainer(
                                                    index: index,
                                                    onRemove:
                                                        () => customerController
                                                            .removeEmail(index),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                    : SizedBox(),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                //!Transaction
                                "Transaction Details",
                                style: customiseStyle(
                                  const Color(0xFFFFFFFF),
                                  FontWeight.bold,
                                  16.0,
                                ),
                              ),
                              Obx(() {
                                return Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                    activeColor: Colors.grey,
                                    thumbColor: WidgetStateProperty.all(
                                      Colors.white,
                                    ),
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: const Color(0xFF212121),
                                    activeTrackColor: Color(0xFF004775),
                                    value:
                                        customerController
                                            .ismoretransaction
                                            .value,
                                    onChanged: (value) async {
                                      customerController
                                          .ismoretransaction
                                          .value = !customerController
                                              .ismoretransaction
                                              .value;
                                    },
                                  ),
                                );
                              }),
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.01),
                          Obx(
                            //! Transaction
                            () =>
                                customerController.ismoretransaction.value ||
                                        widget.edit == true
                                    ? Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                // Column(
                                                //   children: [
                                                //     Row(
                                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //       children: [
                                                //         Expanded(
                                                //           child: TextFormField(
                                                //             cursorColor: Color(0xFFFFFFFF),
                                                //             initialValue: addresslist.label,
                                                //             onChanged: (value) {
                                                //               addresslist.label = value;
                                                //               customerController.updateAddress(
                                                //                   widget.index, addresslist);
                                                //             },
                                                //             style: customiseStyle(
                                                //                 const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                                                //             decoration: newDesignTextfield(
                                                //               hintText: 'Label',
                                                //             ),
                                                //           ),
                                                //         ),
                                                //         SizedBox(width: screenSize.width * 0.02),
                                                //         Expanded(
                                                //           child: TextFormField(
                                                //             cursorColor: Color(0xFFFFFFFF),
                                                //             initialValue: addresslist.buildingNumber,
                                                //             onChanged: (value) {
                                                //               addresslist.buildingNumber = value;
                                                //               customerController.updateAddress(
                                                //                   widget.index, addresslist);
                                                //             },
                                                //             style: customiseStyle(
                                                //                 const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                                                //             keyboardType: const TextInputType.numberWithOptions(
                                                //                 signed: true, decimal: true),
                                                //             inputFormatters: [
                                                //               FilteringTextInputFormatter.allow(
                                                //                   RegExp(r'^\d+\.?\d{0,8}')),
                                                //             ],
                                                //             decoration: newDesignTextfield(
                                                //               hintText: 'Building Number',
                                                //             ),
                                                //           ),
                                                //         ),
                                                //       ],
                                                //     )
                                                //   ],
                                                // ),
                                                SizedBox(
                                                  height:
                                                      screenSize.height * 0.01,
                                                ),
                                                // Column(
                                                //   children: [
                                                //     Row(
                                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //       children: [
                                                //         Expanded(
                                                //           child: TextFormField(
                                                //             cursorColor: Color(0xFFFFFFFF),
                                                //             initialValue: addresslist.streetName,
                                                //             onChanged: (value) {
                                                //               addresslist.streetName = value;
                                                //               customerController.updateAddress(
                                                //                   widget.index, addresslist);
                                                //             },
                                                //             style: customiseStyle(
                                                //                 const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                                                //             decoration: newDesignTextfield(
                                                //               hintText: 'Street Name',
                                                //             ),
                                                //           ),
                                                //         ),
                                                //         SizedBox(width: screenSize.width * 0.02),
                                                //         Expanded(
                                                //           child: TextFormField(
                                                //             cursorColor: Color(0xFFFFFFFF),
                                                //             initialValue: addresslist.streetNameArabic,
                                                //             onChanged: (value) {
                                                //               addresslist.streetNameArabic = value;
                                                //               customerController.updateAddress(
                                                //                   widget.index, addresslist);
                                                //             },
                                                //             style: customiseStyle(
                                                //                 const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                                                //             decoration: newDesignTextfield(
                                                //               hintText: 'Street Name (Arabic)',
                                                //             ),
                                                //           ),
                                                //         ),
                                                //       ],
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(height: screenSize.height * 0.01),
                                                // Column(
                                                //   children: [
                                                //     Row(
                                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //       children: [
                                                //         Expanded(
                                                //           child: TextFormField(
                                                //             cursorColor: Color(0xFFFFFFFF),
                                                //             initialValue: addresslist.district,
                                                //             onChanged: (value) {
                                                //               addresslist.district = value;
                                                //               customerController.updateAddress(
                                                //                   widget.index, addresslist);
                                                //             },
                                                //             style: customiseStyle(
                                                //                 const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                                                //             decoration: newDesignTextfield(
                                                //               hintText: 'District or City Subdivision',
                                                //             ),
                                                //           ),
                                                //         ),
                                                //         SizedBox(width: screenSize.width * 0.02),
                                                //         Expanded(
                                                //           child: TextFormField(
                                                //             cursorColor: Color(0xFFFFFFFF),
                                                //             initialValue: addresslist.districtArabic,
                                                //             onChanged: (value) {
                                                //               addresslist.districtArabic = value;
                                                //               customerController.updateAddress(
                                                //                   widget.index, addresslist);
                                                //             },
                                                //             style: customiseStyle(
                                                //                 const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                                                //             decoration: newDesignTextfield(
                                                //               hintText: 'District or City Subdivision (Arabic)',
                                                //             ),
                                                //           ),
                                                //         ),
                                                //       ],
                                                //     )
                                                //   ],
                                                // ),
                                                // SizedBox(height: screenSize.height * 0.01),
                                                // Column(
                                                //   children: [
                                                //     Row(
                                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //       children: [
                                                //         Expanded(
                                                //           child: TextFormField(
                                                //             cursorColor: Color(0xFFFFFFFF),
                                                //             initialValue: addresslist.state,
                                                //             onChanged: (value) {
                                                //               addresslist.state = value;
                                                //               customerController.updateAddress(
                                                //                   widget.index, addresslist);
                                                //             },
                                                //             style: customiseStyle(
                                                //                 const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                                                //             decoration: newDesignTextfield(
                                                //               hintText: 'State or Province',
                                                //             ),
                                                //           ),
                                                //         ),
                                                //         SizedBox(width: screenSize.width * 0.02),
                                                //         Expanded(
                                                //           child: TextFormField(
                                                //             cursorColor: Color(0xFFFFFFFF),
                                                //             initialValue: addresslist.stateArabic,
                                                //             onChanged: (value) {
                                                //               addresslist.stateArabic = value;
                                                //               customerController.updateAddress(
                                                //                   widget.index, addresslist);
                                                //             },
                                                //             style: customiseStyle(
                                                //                 const Color(0xFFFFFFFF), FontWeight.w500, 14.0),
                                                //             decoration: newDesignTextfield(
                                                //               hintText: 'State or Province (Arabic)',
                                                //             ),
                                                //           ),
                                                //         ),
                                                //       ],
                                                //     )
                                                //   ],
                                                // ),
                                                // SizedBox(height: screenSize.height * 0.02),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                screenSize
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                  color: Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      8.0,
                                                                ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Price Category Name",
                                                                  style: customiseStyle(
                                                                    const Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                    FontWeight
                                                                        .w500,
                                                                    14.0,
                                                                  ),
                                                                ),
                                                                DropdownButtonHideUnderline(
                                                                  child: Obx(() {
                                                                    return DropdownButton<
                                                                      String
                                                                    >(
                                                                      isExpanded:
                                                                          true,
                                                                      style: customiseStyle(
                                                                        const Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                        FontWeight
                                                                            .w500,
                                                                        14.0,
                                                                      ),
                                                                      value:
                                                                          customerController.selectedPriceCategory.value.isEmpty
                                                                              ? null
                                                                              : customerController.selectedPriceCategory.value,
                                                                      dropdownColor:
                                                                          const Color(
                                                                            0xFF004775,
                                                                          ),
                                                                      icon: const Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                      ),
                                                                      items:
                                                                          customerController.pricecategoryList.map((
                                                                            country,
                                                                          ) {
                                                                            return DropdownMenuItem<
                                                                              String
                                                                            >(
                                                                              value:
                                                                                  country,
                                                                              child: Text(
                                                                                country,
                                                                                style: customiseStyle(
                                                                                  const Color(
                                                                                    0xFFFFFFFF,
                                                                                  ),
                                                                                  FontWeight.w500,
                                                                                  14.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }).toList(),
                                                                      onChanged: (
                                                                        value,
                                                                      ) {
                                                                        if (value !=
                                                                            null) {
                                                                          customerController
                                                                              .selectedPriceCategory
                                                                              .value = value;
                                                                        }
                                                                      },
                                                                    );
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              screenSize.width *
                                                              0.02,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                screenSize
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                  color: Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      8.0,
                                                                ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Country",
                                                                  style: customiseStyle(
                                                                    const Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                    FontWeight
                                                                        .w500,
                                                                    14.0,
                                                                  ),
                                                                ),
                                                                DropdownButtonHideUnderline(
                                                                  child: Obx(() {
                                                                    return DropdownButton<
                                                                      String
                                                                    >(
                                                                      isExpanded:
                                                                          true,
                                                                      style: customiseStyle(
                                                                        const Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                        FontWeight
                                                                            .w500,
                                                                        14.0,
                                                                      ),
                                                                      value:
                                                                          customerController.selectedCountryName.value.isEmpty
                                                                              ? null
                                                                              : customerController.selectedCountryName.value,
                                                                      dropdownColor:
                                                                          const Color(
                                                                            0xFF004775,
                                                                          ),
                                                                      icon: const Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                      ),
                                                                      items:
                                                                          customerController.countryList.map((
                                                                            country,
                                                                          ) {
                                                                            return DropdownMenuItem<
                                                                              String
                                                                            >(
                                                                              value:
                                                                                  country,
                                                                              child: Text(
                                                                                country,
                                                                                style: customiseStyle(
                                                                                  const Color(
                                                                                    0xFFFFFFFF,
                                                                                  ),
                                                                                  FontWeight.w500,
                                                                                  14.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }).toList(),
                                                                      onChanged: (
                                                                        value,
                                                                      ) {
                                                                        if (value !=
                                                                            null) {
                                                                          customerController
                                                                              .selectedCountryName
                                                                              .value = value;
                                                                        }
                                                                      },
                                                                    );
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      screenSize.height * 0.01,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                screenSize
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                  color: Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      8.0,
                                                                ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Tax Treatment",
                                                                  style: customiseStyle(
                                                                    const Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                    FontWeight
                                                                        .w500,
                                                                    14.0,
                                                                  ),
                                                                ),
                                                                DropdownButtonHideUnderline(
                                                                  child: Obx(() {
                                                                    return DropdownButton<
                                                                      String
                                                                    >(
                                                                      isExpanded:
                                                                          true,
                                                                      style: customiseStyle(
                                                                        const Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                        FontWeight
                                                                            .w500,
                                                                        14.0,
                                                                      ),
                                                                      value:
                                                                          customerController.selectedTaxTreatmentText.value.isEmpty
                                                                              ? null
                                                                              : customerController.selectedTaxTreatmentText.value,
                                                                      dropdownColor:
                                                                          const Color(
                                                                            0xFF004775,
                                                                          ),
                                                                      icon: const Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                      ),
                                                                      items: [
                                                                        DropdownMenuItem<
                                                                          String
                                                                        >(
                                                                          value:
                                                                              "1",
                                                                          child: Text(
                                                                            '(B2C) Customer',
                                                                            style: customiseStyle(
                                                                              const Color(
                                                                                0xFFFFFFFF,
                                                                              ),
                                                                              FontWeight.w500,
                                                                              14.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        DropdownMenuItem<
                                                                          String
                                                                        >(
                                                                          value:
                                                                              '0',
                                                                          child: Text(
                                                                            '(B2B) Customer',
                                                                            style: customiseStyle(
                                                                              const Color(
                                                                                0xFFFFFFFF,
                                                                              ),
                                                                              FontWeight.w500,
                                                                              14.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                      onChanged: (
                                                                        value,
                                                                      ) {
                                                                        if (value !=
                                                                            null) {
                                                                          customerController.updateTaxTreatment(
                                                                            value,
                                                                          );
                                                                          customerController
                                                                              .selectedTaxTreatmentText
                                                                              .value = value;
                                                                          customerController
                                                                              .taxId
                                                                              .value = value;
                                                                          log(
                                                                            'Selected customerController.taxId.value: ${customerController.taxId.value}',
                                                                          );
                                                                          log(
                                                                            'Selected s  customerController.selectedTaxTreatmentText.value: ${customerController.selectedTaxTreatmentText.value}',
                                                                          );
                                                                        }
                                                                      },
                                                                    );
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              screenSize.width *
                                                              0.02,
                                                        ),
                                                        Obx(
                                                          () => Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                customerController
                                                                            .taxId
                                                                            .value !=
                                                                        "1"
                                                                    ? Text(
                                                                      "Tax No",
                                                                      style: customiseStyle(
                                                                        const Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                        FontWeight
                                                                            .w500,
                                                                        14.0,
                                                                      ),
                                                                    )
                                                                    : SizedBox(),
                                                                customerController
                                                                            .taxId
                                                                            .value !=
                                                                        "1"
                                                                    ? TextFormField(
                                                                      cursorColor:
                                                                          Color(
                                                                            0xFFFFFFFF,
                                                                          ),
                                                                      controller:
                                                                          customerController
                                                                              .taxNoController,
                                                                      style: customiseStyle(
                                                                        const Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                        FontWeight
                                                                            .w500,
                                                                        14.0,
                                                                      ),
                                                                      keyboardType: const TextInputType.numberWithOptions(
                                                                        signed:
                                                                            true,
                                                                        decimal:
                                                                            true,
                                                                      ),
                                                                      inputFormatters: [
                                                                        FilteringTextInputFormatter.allow(
                                                                          RegExp(
                                                                            r'^\d+\.?\d{0,8}',
                                                                          ),
                                                                        ),
                                                                      ],
                                                                      decoration: newDesignTextfield(
                                                                        hintText:
                                                                            'Tax Number',
                                                                      ),
                                                                      validator: (
                                                                        value,
                                                                      ) {
                                                                        if (customerController.taxId.value ==
                                                                            "0") {
                                                                          if (customerController
                                                                              .taxNoController
                                                                              .text
                                                                              .isEmpty) {
                                                                            return 'Please select a tax treatment first'.tr;
                                                                          }
                                                                          if (value ==
                                                                                  null ||
                                                                              value.trim().isEmpty) {
                                                                            return 'Tax No is required'.tr;
                                                                          }
                                                                          if (value.length !=
                                                                              15) {
                                                                            return 'Tax No must be exactly 15 digits'.tr;
                                                                          }
                                                                          if (!RegExp(
                                                                            r'^3\d{13}3$',
                                                                          ).hasMatch(
                                                                            value,
                                                                          )) {
                                                                            return 'Tax No must start and end with 3 and contain only digits'.tr;
                                                                          }
                                                                        }
                                                                        return null;
                                                                      },
                                                                    )
                                                                    : SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      screenSize.height * 0.01,
                                                ),

                                                Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Credit Period",
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                              ),
                                                              TextFormField(
                                                                  focusNode: creditPeriodFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(creditLimitFocus);
                            },
                                                                controller:
                                                                    customerController
                                                                        .creditPeriod,
                                                                cursorColor:
                                                                    Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                                keyboardType:
                                                                    const TextInputType.numberWithOptions(
                                                                      signed:
                                                                          true,
                                                                      decimal:
                                                                          true,
                                                                    ),
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter.allow(
                                                                    RegExp(
                                                                      r'^\d+\.?\d{0,8}',
                                                                    ),
                                                                  ),
                                                                ],
                                                                decoration:
                                                                    newDesignTextfield(
                                                                      hintText:
                                                                          'Credit Period',
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              screenSize.width *
                                                              0.02,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Credit Limit",
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                              ),
                                                              TextFormField(
                                                                focusNode: creditLimitFocus,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(creditLimitFocus);
                            // },
                                                                controller:
                                                                    customerController
                                                                        .creditLimit,
                                                                cursorColor:
                                                                    Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                                keyboardType:
                                                                    const TextInputType.numberWithOptions(
                                                                      signed:
                                                                          true,
                                                                      decimal:
                                                                          true,
                                                                    ),
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter.allow(
                                                                    RegExp(
                                                                      r'^\d+\.?\d{0,8}',
                                                                    ),
                                                                  ),
                                                                ],
                                                                decoration:
                                                                    newDesignTextfield(
                                                                      hintText:
                                                                          'Credit Limit',
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      screenSize.height * 0.01,
                                                ),
                                                Column(
                                                  children: [
                                                    Obx(
                                                      () => Row(
                                                        children: [
                                                          Checkbox(
                                                            activeColor: Color(
                                                              0xFF004775,
                                                            ),
                                                            value:
                                                                customerController
                                                                    .billwise
                                                                    .value,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    50,
                                                                  ),
                                                            ),
                                                            onChanged: (
                                                              bool? value,
                                                            ) {
                                                              if (value !=
                                                                  null) {
                                                                customerController
                                                                        .billwise
                                                                        .value =
                                                                    value;
                                                              }
                                                            },
                                                          ),
                                                          Text(
                                                            "Bill Wise Applicable",
                                                            style:
                                                                customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                          ),
                                                          Checkbox(
                                                            value:
                                                                customerController
                                                                    .isactive
                                                                    .value,
                                                            activeColor: Color(
                                                              0xFF004775,
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    50,
                                                                  ),
                                                            ),
                                                            onChanged: (
                                                              bool? value,
                                                            ) {
                                                              if (value !=
                                                                  null) {
                                                                customerController
                                                                        .isactive
                                                                        .value =
                                                                    value;
                                                              }
                                                            },
                                                          ),
                                                          Text(
                                                            "Is Active",
                                                            style:
                                                                customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(
                                                  height:
                                                      screenSize.height * 0.01,
                                                ),

                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                screenSize
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                  color: Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      8.0,
                                                                ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Party Identification Code",
                                                                  style: customiseStyle(
                                                                    const Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                    FontWeight
                                                                        .w500,
                                                                    14.0,
                                                                  ),
                                                                ),
                                                                DropdownButtonHideUnderline(
                                                                  child: Obx(() {
                                                                    return DropdownButton<
                                                                      String
                                                                    >(
                                                                      isExpanded:
                                                                          true,
                                                                      style: customiseStyle(
                                                                        const Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                        FontWeight
                                                                            .w500,
                                                                        14.0,
                                                                      ),
                                                                      value:
                                                                          customerController.selectedParty.value.isEmpty
                                                                              ? null
                                                                              : customerController.selectedParty.value,
                                                                      dropdownColor:
                                                                          const Color(
                                                                            0xFF004775,
                                                                          ),
                                                                      icon: const Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: Color(
                                                                          0xFFFFFFFF,
                                                                        ),
                                                                      ),
                                                                      items:
                                                                          customerController.partyidentificationList.map((
                                                                            country,
                                                                          ) {
                                                                            return DropdownMenuItem<
                                                                              String
                                                                            >(
                                                                              value:
                                                                                  country,
                                                                              child: Text(
                                                                                country,
                                                                                style: customiseStyle(
                                                                                  const Color(
                                                                                    0xFFFFFFFF,
                                                                                  ),
                                                                                  FontWeight.w500,
                                                                                  14.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }).toList(),
                                                                      onChanged: (
                                                                        value,
                                                                      ) {
                                                                        if (value !=
                                                                            null) {
                                                                          customerController
                                                                              .selectedParty
                                                                              .value = value;
                                                                        }
                                                                      },
                                                                    );
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              screenSize.width *
                                                              0.02,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "ID No",
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                              ),
                                                              TextFormField(
                                                                focusNode: idNoFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(salesDiscountFocus);
                            },
                                                                controller:
                                                                    customerController
                                                                        .idNo,
                                                                cursorColor:
                                                                    Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                                keyboardType:
                                                                    const TextInputType.numberWithOptions(
                                                                      signed:
                                                                          true,
                                                                      decimal:
                                                                          true,
                                                                    ),
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter.allow(
                                                                    RegExp(
                                                                      r'^\d+\.?\d{0,8}',
                                                                    ),
                                                                  ),
                                                                ],
                                                                decoration:
                                                                    newDesignTextfield(
                                                                      hintText:
                                                                          'ID No',
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      screenSize.height * 0.01,
                                                ),

                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Sales Discount %",
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                              ),
                                                              TextFormField(
                                                                focusNode: salesDiscountFocus,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(creditLimitFocus);
                            // },
                                                                controller:
                                                                    customerController
                                                                        .salesDiscount,
                                                                cursorColor:
                                                                    Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                                keyboardType:
                                                                    const TextInputType.numberWithOptions(
                                                                      signed:
                                                                          true,
                                                                      decimal:
                                                                          true,
                                                                    ),
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter.allow(
                                                                    RegExp(
                                                                      r'^\d+\.?\d{0,8}',
                                                                    ),
                                                                  ),
                                                                ],
                                                                decoration:
                                                                    newDesignTextfield(
                                                                      hintText:
                                                                          'Sales Discount %',
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              screenSize.width *
                                                              0.02,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "",
                                                                style: customiseStyle(
                                                                  const Color(
                                                                    0xFFFFFFFF,
                                                                  ),
                                                                  FontWeight
                                                                      .w500,
                                                                  14.0,
                                                                ),
                                                              ),
                                                              // TextFormField(
                                                              //   cursorColor:
                                                              //       Color(0xFFFFFFFF),
                                                              //   style: customiseStyle(
                                                              //       const Color(
                                                              //           0xFFFFFFFF),
                                                              //       FontWeight.w500,
                                                              //       14.0),
                                                              //   keyboardType:
                                                              //       const TextInputType
                                                              //           .numberWithOptions(
                                                              //           signed: true,
                                                              //           decimal: true),
                                                              //   inputFormatters: [
                                                              //     FilteringTextInputFormatter
                                                              //         .allow(RegExp(
                                                              //             r'^\d+\.?\d{0,8}')),
                                                              //   ],
                                                              //   decoration:
                                                              //       newDesignTextfield(
                                                              //     hintText: 'ID No',
                                                              //   ),
                                                              // )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                    : SizedBox(),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                //!Bank
                                "Bank Details",
                                style: customiseStyle(
                                  const Color(0xFFFFFFFF),
                                  FontWeight.bold,
                                  16.0,
                                ),
                              ),
                              Obx(() {
                                return Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                    activeColor: Colors.grey,
                                    thumbColor: WidgetStateProperty.all(
                                      Colors.white,
                                    ),
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: const Color(0xFF212121),
                                    activeTrackColor: Color(0xFF004775),
                                    value: customerController.ismorebank.value,
                                    onChanged: (value) async {
                                      customerController.ismorebank.value =
                                          !customerController.ismorebank.value;
                                    },
                                  ),
                                );
                              }),
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.01),
                          Obx(
                            () =>
                                customerController.ismorebank.value
                                    ? Column(
                                      children: [
                                        Column(
                                          //!bank
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Bank Details",
                                                  style: customiseStyle(
                                                    const Color(0xFFFFFFFF),
                                                    FontWeight.bold,
                                                    14.0,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    customerController
                                                        .addBank();
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Color(
                                                          0xFF10C103,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Add New",
                                                        style: customiseStyle(
                                                          const Color(
                                                            0xFF10C103,
                                                          ),
                                                          FontWeight.bold,
                                                          14.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Obx(
                                              () => ListView.separated(
                                                separatorBuilder: (
                                                  context,
                                                  index,
                                                ) {
                                                  return Divider(
                                                    color: Colors.transparent,
                                                  );
                                                },
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    customerController
                                                        .bankList
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  return BankContainer(
                                                    index: index,
                                                    onRemove:
                                                        () => customerController
                                                            .removeBank(index),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenSize.height * 0.01,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                    : SizedBox(),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (widget.edit) {
                                    final model = CustomerModel(
                                      id: widget.customerId,
                                      customerCode:
                                          customerController.customerCode.text,
                                      ledgerName:
                                          customerController
                                              .ledgernameController
                                              .text,
                                      registeredName:
                                          customerController
                                              .registerednameController
                                              .text,
                                      registeredNameArabic:
                                          customerController
                                              .registerednameArabicController
                                              .text,
                                      balance: customerController.balance.text,
                                      type:
                                          customerController
                                              .dropdownvalue
                                              .value,
                                      selectedDate:
                                          customerController
                                              .dateController
                                              .text,
                                    );

                                    final List<AddressModel>
                                    updatedAddressModel =
                                        customerController.label
                                            .asMap()
                                            .map((index, value) {
                                              return MapEntry(
                                                index,
                                                AddressModel(
                                                  customerId: model.id ?? 0,
                                                  label: value.text,
                                                  buildingNumber:
                                                      customerController
                                                          .buildingNumber[index]
                                                          .text,
                                                  streetName:
                                                      customerController
                                                          .streetName[index]
                                                          .text,
                                                  streetNameArabic:
                                                      customerController
                                                          .streetNameArabic[index]
                                                          .text,
                                                  district:
                                                      customerController
                                                          .district[index]
                                                          .text,
                                                  districtArabic:
                                                      customerController
                                                          .districtArabic[index]
                                                          .text,
                                                  state:
                                                      customerController
                                                          .state[index]
                                                          .text,
                                                  stateArabic:
                                                      customerController
                                                          .stateArabic[index]
                                                          .text,
                                                  postalCode:
                                                      customerController
                                                          .postalCode[index]
                                                          .text,
                                                  country:
                                                      customerController
                                                          .selectedCountry
                                                          .value,
                                                ),
                                              );
                                            })
                                            .values
                                            .toList();

                                    final List<PhoneModel> updatedPhoneModel =
                                        customerController.phoneno
                                            .asMap()
                                            .map((index, value) {
                                              return MapEntry(
                                                index,
                                                PhoneModel(
                                                  customerId: model.id ?? 0,
                                                  type:
                                                      customerController
                                                          .phoneType[index]
                                                          .text,
                                                  phoneno:
                                                      customerController
                                                          .phoneno[index]
                                                          .text,
                                                ),
                                              );
                                            })
                                            .values
                                            .toList();

                                    final updatedEmailModel =
                                        customerController.Email.asMap()
                                            .map((key, value) {
                                              return MapEntry(
                                                key,
                                                EmailModel(
                                                  customerId: model.id ?? 0,
                                                  type:
                                                      customerController
                                                          .emailType[key]
                                                          .text,
                                                  Email:
                                                      customerController
                                                          .Email[key]
                                                          .text,
                                                ),
                                              );
                                            })
                                            .values
                                            .toList();

                                    final updatedTransactionModel = [
                                      TransactionModel(
                                        customerId: model.id ?? 0,
                                        billWiseApplicable:
                                            customerController.billwise.value,
                                        country:
                                            customerController
                                                .selectedCountryName
                                                .value,
                                        creditLimit:
                                            customerController.creditLimit.text,
                                        creditPeriod:
                                            customerController
                                                .creditPeriod
                                                .text,
                                        idNo: customerController.idNo.text,
                                        isActive:
                                            customerController.isactive.value,
                                        partyIdentificationCode:
                                            customerController
                                                .selectedParty
                                                .value,
                                        priceCategoryName:
                                            customerController
                                                .selectedPriceCategory
                                                .value,
                                        salesDiscount:
                                            customerController
                                                .salesDiscount
                                                .text,
                                        taxTreatment:
                                            customerController
                                                .taxTreatmentType
                                                .value,
                                      ),
                                    ];

                                    final updatedBankModel =
                                        customerController.bankname
                                            .asMap()
                                            .map((key, value) {
                                              return MapEntry(
                                                key,
                                                BankModel(
                                                  accountname:
                                                      customerController
                                                          .accountname[key]
                                                          .text,
                                                  accountno:
                                                      customerController
                                                          .accountno[key]
                                                          .text,
                                                  bankname:
                                                      customerController
                                                          .bankname[key]
                                                          .text,
                                                  customerId: model.id ?? 0,
                                                  ifsccode:
                                                      customerController
                                                          .ifsccode[key]
                                                          .text,
                                                  label:
                                                      customerController
                                                          .bankLabel[key]
                                                          .text,
                                                ),
                                              );
                                            })
                                            .values
                                            .toList();

                                    await customerController.editCustomer(
                                      model,
                                      updatedAddressModel,
                                      updatedPhoneModel,
                                      updatedEmailModel,
                                      updatedTransactionModel,
                                      updatedBankModel,
                                    );

                                    Get.back();

                                    customerController.customerCode.clear();
                                    customerController.ledgernameController
                                        .clear();
                                    customerController.registerednameController
                                        .clear();
                                    customerController
                                        .registerednameArabicController
                                        .clear();
                                    customerController.balance.clear();
                                    customerController.dateController.clear();
                                  } else {
                                    if (customerController
                                            .customerCode
                                            .text
                                            .isNotEmpty &&
                                        customerController
                                            .ledgernameController
                                            .text
                                            .isNotEmpty) {
                                      final model = CustomerModel(
                                        customerCode:
                                            customerController
                                                .customerCode
                                                .text,
                                        ledgerName:
                                            customerController
                                                .ledgernameController
                                                .text,
                                        registeredName:
                                            customerController
                                                .registerednameController
                                                .text,
                                        registeredNameArabic:
                                            customerController
                                                .registerednameArabicController
                                                .text,
                                        balance:
                                            customerController.balance.text,
                                        type:
                                            customerController
                                                .dropdownvalue
                                                .value,
                                        selectedDate:
                                            customerController
                                                .dateController
                                                .text,
                                      );

                                      final List<AddressModel> addressModel =
                                          customerController.label
                                              .asMap()
                                              .map((index, value) {
                                                return MapEntry(
                                                  index,
                                                  AddressModel(
                                                    customerId: model.id ?? 0,
                                                    label: value.text,
                                                    buildingNumber:
                                                        customerController
                                                            .buildingNumber[index]
                                                            .text,
                                                    streetName:
                                                        customerController
                                                            .streetName[index]
                                                            .text,
                                                    streetNameArabic:
                                                        customerController
                                                            .streetNameArabic[index]
                                                            .text,
                                                    district:
                                                        customerController
                                                            .district[index]
                                                            .text,
                                                    districtArabic:
                                                        customerController
                                                            .districtArabic[index]
                                                            .text,
                                                    state:
                                                        customerController
                                                            .state[index]
                                                            .text,
                                                    stateArabic:
                                                        customerController
                                                            .stateArabic[index]
                                                            .text,
                                                    postalCode:
                                                        customerController
                                                            .postalCode[index]
                                                            .text,
                                                    country:
                                                        customerController
                                                            .selectedCountry
                                                            .value,
                                                  ),
                                                );
                                              })
                                              .values
                                              .toList();

                                      final List<PhoneModel> phoneModel =
                                          customerController.phoneno
                                              .asMap()
                                              .map((index, value) {
                                                return MapEntry(
                                                  index,
                                                  PhoneModel(
                                                    customerId: model.id ?? 0,
                                                    type:
                                                        customerController
                                                            .phoneType[index]
                                                            .text,
                                                    phoneno:
                                                        customerController
                                                            .phoneno[index]
                                                            .text,
                                                  ),
                                                );
                                              })
                                              .values
                                              .toList();

                                      final emailModel =
                                          customerController.Email.asMap()
                                              .map((key, value) {
                                                return MapEntry(
                                                  key,
                                                  EmailModel(
                                                    customerId: model.id ?? 0,
                                                    type:
                                                        customerController
                                                            .emailType[key]
                                                            .text,
                                                    Email:
                                                        customerController
                                                            .Email[key]
                                                            .text,
                                                  ),
                                                );
                                              })
                                              .values
                                              .toList();

                                      final transactionModel = [
                                        TransactionModel(
                                          customerId: model.id ?? 0,
                                          billWiseApplicable:
                                              customerController.billwise.value,
                                          country:
                                              customerController
                                                  .selectedCountryName
                                                  .value,
                                          creditLimit:
                                              customerController
                                                  .creditLimit
                                                  .text,
                                          creditPeriod:
                                              customerController
                                                  .creditPeriod
                                                  .text,
                                          idNo: customerController.idNo.text,
                                          isActive:
                                              customerController.isactive.value,
                                          partyIdentificationCode:
                                              customerController
                                                  .selectedParty
                                                  .value,
                                          priceCategoryName:
                                              customerController
                                                  .selectedPriceCategory
                                                  .value,
                                          salesDiscount:
                                              customerController
                                                  .salesDiscount
                                                  .text,
                                          taxTreatment:
                                              customerController
                                                  .taxTreatmentType
                                                  .value,
                                        ),
                                      ];

                                      final bankModel =
                                          customerController.bankname
                                              .asMap()
                                              .map((key, value) {
                                                return MapEntry(
                                                  key,
                                                  BankModel(
                                                    accountname:
                                                        customerController
                                                            .accountname[key]
                                                            .text,
                                                    accountno:
                                                        customerController
                                                            .accountno[key]
                                                            .text,
                                                    bankname:
                                                        customerController
                                                            .bankname[key]
                                                            .text,
                                                    customerId: model.id ?? 0,
                                                    ifsccode:
                                                        customerController
                                                            .ifsccode[key]
                                                            .text,
                                                    label:
                                                        customerController
                                                            .bankLabel[key]
                                                            .text,
                                                  ),
                                                );
                                              })
                                              .values
                                              .toList();

                                      await customerController
                                          .addCompleteCustomerDetails(
                                            model,
                                            addressModel,
                                            phoneModel,
                                            emailModel,
                                            transactionModel,
                                            bankModel,
                                          );

                                      Get.back();
                                      customerController.customerCode.clear();
                                      customerController.ledgernameController
                                          .clear();
                                      customerController
                                          .registerednameController
                                          .clear();
                                      customerController
                                          .registerednameArabicController
                                          .clear();
                                      customerController.balance.clear();
                                      customerController.dateController.clear();
                                    } else {
                                      customerController
                                              .customerCode
                                              .text
                                              .isEmpty
                                          ? ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please Enter Customer Code',
                                              ),
                                            ),
                                          )
                                          : ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please Enter Ledger Name',
                                              ),
                                            ),
                                          );
                                    }
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.blue,
                                  child: Text(
                                    widget.edit ? 'Update' : 'Add',
                                    style: customiseStyle(
                                      Colors.white,
                                      FontWeight.bold,
                                      14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
