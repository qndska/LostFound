import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
        child: Text('This is the homepage.'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0, 
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(40, 35, 0, 76),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white, // Add background color
          items: [
            BottomNavigationBarItem(
              icon: Center(
                child: Icon(
                  Icons.home_outlined,
                  size: 24,
                ),
              ),
              label: ".", 
            ),
            BottomNavigationBarItem(
              icon: Center(
                child: Icon(
                  Icons.add_circle_outlined,
                  size: 24,
                ),
              ),
              label: ".",
            ),
            BottomNavigationBarItem(
              icon: Center(
                child: Icon(
                  Icons.notifications_outlined,
                  size: 24,
                ),
              ),
              label: ".",
            ),
            BottomNavigationBarItem(
              icon: Center(
                child: Icon(
                  Icons.person_outline_rounded,
                  size: 24,
                ),
              ),
              label: ".",
            ),
          ],
          currentIndex: selectedIndex,
          unselectedItemColor: Color.fromARGB(255, 164, 138, 214),
          selectedItemColor: Color.fromARGB(255, 253, 88, 115), // Pink color for selected item
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 0, // Hide label
          selectedFontSize: 20, // Set selected label font size
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Bold selected label
        ),
      ),
    );
  }
}
