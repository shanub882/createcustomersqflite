import 'package:customerdata_sqflite/customer/controller/customerController.dart';
import 'package:customerdata_sqflite/customer/global/global.dart';
import 'package:customerdata_sqflite/customer/screen/addCustomer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: () {
            Get.to(() => CreateCustomerScreen(edit: false,customerId: 0,));
          },
          child: Text(
            'Add',
            style: customiseStyle(Colors.black, FontWeight.bold, 14.0),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          children: [
            Obx(() {
              return controller.customer.isEmpty
                  ? Center(child: Text('No Customer Found!'))
                  : Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          DataTable(
                            columns: [
                              DataColumn(label: Text('Customer Code')),
                              DataColumn(label: Text('Ledger Name')),
                           
                              DataColumn(label: Text('View')),
                              DataColumn(label: Text('Delete')),
                            ],
                            rows: List.generate(controller.customer.length, (
                              index,
                            ) {
                              final customerData = controller.customer[index];
                            
                          
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(customerData.customerCode.toString()),
                                  ),
                                  DataCell(
                                    Text(customerData.ledgerName.toString()),
                                  ),
                                 
                                  DataCell(InkWell(
                                    onTap: () {
                                      Get.to(()=> CreateCustomerScreen(
                                      edit: true,
                                      customerId: customerData.id!,
                                   
                                      ));
                                    },
                                    child: Icon(Icons.edit, color: Colors.blue))),
                                  DataCell(InkWell(
                                    
                                    onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text('Delete!'),
                                                    content: Text(
                                                      'Do you want to delete?',
                                                    ),
                                                    actions: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          InkWell(
                                                            onTap: () => Get.back(),
                                                            child: Text('Cancel'),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                             controller.deleteCustomer(customerData);
                                                              Get.back();
                                                            },
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            
                                    child: Icon(Icons.delete, color: Colors.red))),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
            }),
          ],
        ),
      ),
    );
  }
}
