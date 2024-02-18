import 'package:flutter/material.dart';
import 'cat_lost_found.dart';
import 'others.dart'; 
import 'dog_lost_found.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Homepage',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF26117A),
        ),
      ),
      centerTitle: true, // Center the title
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            PageHeader(),
            SizedBox(height: 20),
            Hellopage(),
            SizedBox(height: 20),
            OvalSearchBar(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionCircle(
                  text: 'Dog',
                  circleColor: Color(0xFFD5EEF6),
                  imagePath: 'assets/DogSelect.png',
                  onTap: () {
                    // Navigate to CatLostFound screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DogLostFound()),
                    );
                  },
                ),
                SizedBox(width: 10), // Add spacing between circles
                OptionCircle(
                  text: 'Cat',
                  circleColor: Color(0xFFF9EFCB),
                  imagePath: 'assets/Cat2.png',
                  onTap: () {
                    // Navigate to CatLostFound screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CatLostFound()),
                    );
                  },
                ),
                SizedBox(width: 10), // Add spacing between circles
                OptionCircle(
                  text: 'Others',
                  circleColor: Color(0xFFFBE3E3),
                  imagePath: 'assets/BlueBird.png',
                  onTap: () {
                    // Navigate to CatLostFound screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => othersLostFound()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            UserInfo(),
            SizedBox(height: 20),
            UserInfofound(),
          ],
        ),
      ),
    ),
    bottomNavigationBar: BottomNavBar(
      selectedIndex: _selectedIndex,
      onItemTapped: (index) {
        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 0) {
            // Navigate to HomePage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        });
      },
    ),
  );
}
}

class OptionCircle extends StatelessWidget {
  final String text;
  final String imagePath; // Changed from IconData to String for the image path
  final Color circleColor;
  final VoidCallback onTap;

  const OptionCircle({
    required this.text,
    required this.imagePath, // Updated the constructor
    required this.circleColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60, // Adjust the width of the circle
            height: 60, // Adjust the height of the circle
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                width: 40, // Adjust the width of the image
                height: 40, // Adjust the height of the image
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/Cloud.png',
          fit: BoxFit.cover, // Ensure the image covers the entire area
          width: MediaQuery.of(context).size.width, // Set the width to match the screen width
          height: 200, // Adjust the height as needed
        ),
        Column(
          children: [
            SizedBox(height: 20), // Add some spacing from the top
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Hi ',
                    style: TextStyle(
                      color: Color(0xFF26117A),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Qndska',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 88, 115),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ', \n\n',
                    style: TextStyle(
                      color: Color(0xFF26117A),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Where is my pet?!',
                    style: TextStyle(
                      color: Color(0xFF26117A),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Hellopage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/pink.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 210,
            ),
            Image.asset(
              'assets/Homepic.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
            Image.asset(
              'assets/Paw.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 210,
            ),
          ],
        ),
      ],
    );
  }
}

class OvalSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/qndska.png'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Qndska',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF26117A)),
                        ),
                        Spacer(),
                        Text(
                          '...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Salaya, Phutthamonthon District, Nakhon Pathom',
                      style: TextStyle(color: Colors.grey[400]!, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 210,
              width: double.infinity,
              child: Image.asset(
                'assets/cat.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Name: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))), // Added 3 tabs
                  SizedBox(width: 62),
                  Text('Percy', style: TextStyle(color: Colors.black)),
                  Spacer(),
                  Text('Missing!!!',
                      style: TextStyle(color: Color(0xFFFF0E0E))),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Type: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))),
                  SizedBox(width: 69),
                  Text('Cat', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Breed: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))),
                  SizedBox(width: 64),
                  Text('Domestic Shorthair',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Gender: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))), // Added 3 tabs
                  SizedBox(width: 54),
                  Text('Male', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Color: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))),
                  SizedBox(width: 65),
                  Text('White/Orange', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Description: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))),
                  SizedBox(width: 30),
                  Text('...', style: TextStyle(color: Colors.black)),
                ],
              ),
              SizedBox(height: 10),
              Text('8 m ago',
                  style: TextStyle(color: Color(0xFF979797), fontSize: 12)),
            ],
          ),
          SizedBox(height: 10),
          ContactButton(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFA5672), // Oval pink contact button color
      ),
      child: TextButton(
        onPressed: () {
          // Add functionality for contact button
        },
        child: Text(
          'Contact',
          style: TextStyle(color: Colors.white),
        ),
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

class UserInfofound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/guwon.png'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Guwon',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF26117A)),
                        ),
                        Spacer(),
                        Text(
                          '...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Salaya, Phutthamonthon District, Nakhon Pathom',
                      style: TextStyle(color: Colors.grey[400]!, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 210,
              width: double.infinity,
              child: Image.asset(
                'assets/ragdoll.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Name: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))), // Added 3 tabs
                  SizedBox(width: 62),
                  Text('Lauren', style: TextStyle(color: Colors.black)),
                  Spacer(),
                  Text('found!!!', style: TextStyle(color: Color(0xFF5DB075))),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Type: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))),
                  SizedBox(width: 69),
                  Text('Cat', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Breed: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))),
                  SizedBox(width: 64),
                  Text('Ragdoll', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Gender: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))), // Added 3 tabs
                  SizedBox(width: 54),
                  Text('Female', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Color: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))),
                  SizedBox(width: 65),
                  Text('White/Brown', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Description: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26117A))),
                  SizedBox(width: 30),
                  Text('...', style: TextStyle(color: Colors.black)),
                ],
              ),
              SizedBox(height: 10),
              Text('8 m ago',
                  style: TextStyle(color: Color(0xFF979797), fontSize: 12)),
            ],
          ),
          SizedBox(height: 10),
          ContactButton(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

