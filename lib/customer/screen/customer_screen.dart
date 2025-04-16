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
        backgroundColor: Color(0xff000000),
        centerTitle: true,
        title: InkWell(
          onTap: () {
            Get.to(() => CreateCustomerScreen(edit: false, customerId: 0));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              Text(
                'Add Customer',
                style: customiseStyle(Colors.white, FontWeight.bold, 14.0),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isloading.value && controller.customer.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.customer.isEmpty) {
          return const Center(child: Text('No Customer Found!'));
        }

        return CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 8,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Customer Code",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Ledger Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Edit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Delete",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final customer = controller.customer[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(customer.customerCode.toString()),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(customer.ledgerName.toString()),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Get.to(
                              () => CreateCustomerScreen(
                                edit: true,
                                customerId: customer.id!,
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder:
                                  (_) => AlertDialog(
                                    title: const Text("Delete!"),
                                    content: const Text(
                                      "Do you want to delete?",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Get.back(),
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.deleteCustomer(customer);
                                          Get.back();
                                        },
                                        child: const Text("Ok"),
                                      ),
                                    ],
                                  ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: controller.customer.length),
            ),
            // Loader at the end
            // SliverToBoxAdapter(
            //   child: Obx(() {
            //     return controller.isloading.value
            //         ? const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 20),
            //           child: Center(child: CircularProgressIndicator()),
            //         )
            //         : const SizedBox.shrink();
            //   }),
            // ),
          ],
        );
      }),
    );
  }
}
