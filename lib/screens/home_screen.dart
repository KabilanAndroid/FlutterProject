import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ro_shops/providers/mainprovider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, dynamic>> data = [
      {"id": 1, "name": "Bumrah"},
      {"id": 2, "name": "Dhoni"},
      {"id": 3, "name": "Kohli"},
      {"id": 4, "name": "Rohit"},
      {"id": 5, "name": "Jadeja"},
      {"id": 6, "name": "Shami"},
      {"id": 7, "name": "Ashwin"},
      {"id": 8, "name": "Pant"},
      {"id": 9, "name": "Shreyas"},
      {"id": 10, "name": "Rahul"},
      {"id": 11, "name": "Umesh"},
      {"id": 12, "name": "Bumrah"},
      {"id": 13, "name": "Dhoni"},
      {"id": 14, "name": "Kohli"},
      {"id": 15, "name": "Rohit"},
      {"id": 16, "name": "Jadeja"},
      {"id": 17, "name": "Shami"},
      {"id": 18, "name": "Ashwin"},
      {"id": 19, "name": "Pant"},
      {"id": 20, "name": "Shreyas"},
    ];
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 600;
    final username = ref.watch(usernameProvider);
    final email = ref.watch(emailProvider);
    final id = ref.watch(idProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fixed: Greeting
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 76, 35, 226),
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(20),
                  bottomEnd: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? 32.0 : 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding:  EdgeInsets.symmetric(vertical: 8.0)),
                    Text(
                      "Hello, $username",
                      style: TextStyle(
                        fontSize: 24,       
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ), 
                    Text(
                      "Enjoy your services",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding:  EdgeInsets.symmetric(vertical: 6.0)),
                    
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(blurRadius: 6, color: Colors.black12),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Scrollable: everything below
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isWide ? 32.0 : 16.0,
                        vertical: 12.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 76, 35, 226),
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(blurRadius: 6, color: Colors.black12),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Free Consultation",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Get free support from \n our customer services",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 20.0,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                      child: Text("Contact Us"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                'assets/images/homeimg1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: isWide ? 32.0 : 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Featured Product",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF585858),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(data[index]['name']));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
