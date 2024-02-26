import 'package:flutter/material.dart';
import 'package:flutter_task/common_file.dart';
import 'package:flutter_task/user/login_user.dart';

class VendorHomePage extends StatefulWidget {
  final List<Product> selectedProducts;

  const VendorHomePage(this.selectedProducts, {Key? key}) : super(key: key);

  @override
  State<VendorHomePage> createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title:
            CustomText("Subash Stationery", black, 24, FontWeight.bold, false),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("Particulars", black, 20, FontWeight.bold, false),
                CustomText("Inventory\nSubhash's\nStationary", black, 20,
                    FontWeight.bold, false),
              ],
            ),
            const SizedBox(height: 20),
            for (Product product in widget.selectedProducts)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          product.name, black, 20, FontWeight.w500, false),
                      Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(width: .5, color: black),
                        ),
                        child: Center(
                          child: CustomText(
                            product.value ?? "",
                            black,
                            10,
                            FontWeight.normal,
                            false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Add space between product rows
                ],
              ),
            const Spacer(),
            MaterialButton(
              elevation: 0.0,
              color: brown,
              height: 60,
              minWidth: 236,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () async {
                if (isLoggedIn) {
                  setState(() {
                    isLoggedIn = false;
                  });

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginUserPage()),
                    (route) => false,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginUserPage()),
                  );
                }
              },
              child: Center(
                child:
                    CustomText("Logout", white, 18, FontWeight.normal, false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
