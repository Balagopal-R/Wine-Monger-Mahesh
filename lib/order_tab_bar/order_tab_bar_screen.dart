import 'package:flutter/material.dart';
import 'package:wine_monger_mahesh/wholesale/wholesale_screen.dart';

class OrderTabBarClass extends StatelessWidget {
  const OrderTabBarClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 32,
          ),
          child: DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: Column(
              children: [
                Container(
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: TabBar(
                    unselectedLabelColor: Colors.grey[900],
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xffCAE3A8)),
                    tabs: [
                      Tab(
                        child: Container(
                          child: const Text(
                            "Leads",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: const Text(" Wholesale ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: const Text("Retail",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      child: const Center(child: Text("leads")),
                    ),

                    const WholeSaleScreen(),
                    
                    Container(
                      child: const Center(child: Text("Retail")),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}