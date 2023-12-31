import 'package:flutter/material.dart';
import 'package:ipssi_flutter/mesWidgets/my_background.dart';
import 'package:ipssi_flutter/mesWidgets/my_profil.dart';
import 'package:ipssi_flutter/view/my_all_users.dart';
import 'package:ipssi_flutter/view/my_loading.dart';
import 'package:ipssi_flutter/view/my_loading_map.dart';
import 'package:ipssi_flutter/view/my_map.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  //variable
  int indexTapped = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.75,
        color: Colors.purple,
        child: const MyProfil(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexTapped,
          onTap: (value) {
            setState(() {
              indexTapped = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Carte"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Personnes")
          ]),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [const MyBackground(), bodyPage()],
      ),
    );
  }

  Widget bodyPage() {
    switch (indexTapped) {
      case 0:
        return const MyLoadingMap();
      case 1:
        return const MyAllUsers();
      default:
        return const Text("erreur");
    }
  }
}
