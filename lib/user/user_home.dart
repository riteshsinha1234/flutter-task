import 'package:flutter/material.dart';
import 'package:flutter_task/common_file.dart';
import 'package:flutter_task/user/login_user.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  Product? selectedPen;
  Product? selectedPencil;
  Product? selectedBooks;
  List<Product> selectedProducts = [];
  bool isLoggedIn = false;
  bool isSaveClicked = false;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText("Pen", black, 20, FontWeight.w500, false),
                DropdownButton<Product>(
                  value: selectedPen,
                  onChanged: (Product? newValue) {
                    // ignore: avoid_print
                    print("Selected Pen: $newValue");
                    setState(() {
                      selectedPen = newValue;
                    });
                  },
                  items: [
                    Product('High', 'high'),
                    Product('Medium', 'medium'),
                    Product('Low', 'low'),
                  ].map<DropdownMenuItem<Product>>((Product value) {
                    return DropdownMenuItem<Product>(
                      value: value,
                      child: Text(
                        value.name,
                        style: const TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText("Pencil", black, 20, FontWeight.w500, false),
                DropdownButton<Product>(
                  value: selectedPencil,
                  onChanged: (Product? newValue) {
                    // ignore: avoid_print
                    print("Selected Pencil: $newValue");
                    setState(() {
                      selectedPencil = newValue;
                    });
                  },
                  items: [
                    Product('High', 'High'),
                    Product('Medium', 'Medium'),
                    Product('Low', 'Low'),
                  ].map<DropdownMenuItem<Product>>((Product value) {
                    return DropdownMenuItem<Product>(
                      value: value,
                      child: Text(
                        value.name,
                        style: const TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText("Books", black, 20, FontWeight.w500, false),
                DropdownButton<Product>(
                  value: selectedBooks,
                  onChanged: (Product? newValue) {
                    // ignore: avoid_print
                    print("Selected Books: $newValue");
                    setState(() {
                      selectedBooks = newValue;
                    });
                  },
                  items: [
                    Product('High', 'High'),
                    Product('Medium', 'Medium'),
                    Product('Low', 'Low'),
                  ].map<DropdownMenuItem<Product>>((Product value) {
                    return DropdownMenuItem<Product>(
                      value: value,
                      child: Text(
                        value.name,
                        style: const TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
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
                if (!isSaveClicked) {
                  // If Save button is not clicked
                  setState(() {
                    isSaveClicked = true;
                  });
                  // Add logic to save the selected items
                  // ...
                  selectedProducts
                      .addAll([selectedPen!, selectedPencil!, selectedBooks!]);
                } else {
                  // If Save button is already clicked, perform logout logic
                  // For example, you can clear user credentials or perform other necessary actions
                  setState(() {
                    isLoggedIn = false;
                  });

                  // Replace the entire navigation stack with the login page
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginUserPage()),
                    (route) => false,
                  );
                }
              },
              child: Center(
                child: CustomText(
                  isSaveClicked ? "Logout" : "Save",
                  white,
                  18,
                  FontWeight.normal,
                  false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
