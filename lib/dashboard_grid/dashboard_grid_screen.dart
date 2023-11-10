import 'package:flutter/material.dart';
import 'package:wine_monger_mahesh/manufactures/manufactures.dart';
import 'package:wine_monger_mahesh/orders/order_screen.dart';
import 'package:wine_monger_mahesh/other_screens/customers_screen.dart';
import 'package:wine_monger_mahesh/other_screens/imports_screen.dart';
import 'package:wine_monger_mahesh/other_screens/products_screen.dart';
import 'package:wine_monger_mahesh/other_screens/sales_screen.dart';
import 'package:wine_monger_mahesh/tastings/tastings.dart';
import '../reservations/reservations.dart';
import '../utils/constants/image_constants.dart';
import 'package:get/get.dart';

class DashBoardGridScreen extends StatelessWidget {
  const DashBoardGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(30),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
               Get.to(const OrderScreen());
              },
              child: GridViewWidget(
                  data: "Orders", gridImage: Image.asset(kdashOrders)),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const TastingsScreen());
              },
              child: GridViewWidget(
                  data: "Tastings", gridImage: Image.asset(kdashTastings)),
            ),

            GestureDetector(
              onTap: () {
                Get.to(const ReservationScreen());
              },
              child: GridViewWidget(
                  data: "Reservations",
                  gridImage: Image.asset(kdashReservations)),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const ManufacturesScreen());
              },
              child: GridViewWidget(
                  data: "Manufactures",
                  gridImage: Image.asset(kdashManufactures)),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const SalesScreen());
              },
              child: GridViewWidget(data: "Sales", gridImage: Image.asset(kdashSales))),
            GestureDetector(
              onTap: () {
                Get.to(const ProductsScreen());
              },
              child: GridViewWidget(
                  data: "Products", gridImage: Image.asset(kdashProducts)),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const CustomersScreen());
              },
              child: GridViewWidget(
                  data: "Customers", gridImage: Image.asset(kdashCustomers)),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const ImportsScreen());
              },
              child: GridViewWidget(
                  data: "Imports", gridImage: Image.asset(kdashImports)),
            ),
          ],
        ));
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.data, required this.gridImage});

  final String data;
  final Image gridImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gridImage,
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  data,
                  style: const TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ));
  }
}
