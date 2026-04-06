import 'package:flutter/material.dart';
import 'package:ro_shops/screens/login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    void handleClick() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    return (
      Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
     body: Container(
       child: Center(
         child: Column(
          children: [
            ElevatedButton(onPressed: handleClick, child: 
            Text("Click Here!!")
            )
          ],
         )
       ),
     ),
    )
    );
  }
}