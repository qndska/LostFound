import 'package:flutter/material.dart';
import 'homepage.dart'; 

class DogLostFound extends StatefulWidget {

  @override
  _MydogLostFoundState createState() => _MydogLostFoundState();
}

class _MydogLostFoundState extends State<DogLostFound> {
  int _selectedIndex = 0;
  String _selectedOption = 'notification';
  bool _isLost = true; // Initially set to true for "Lost" option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Dogs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF26117A),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/notification_icon.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Add functionality for notification icon
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              OptionButtonFrame(
                options: ['Lost', 'Found'],
                selectedOption: _selectedOption,
                onSelect: _onOptionSelected,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        // Clear text in the search field
                      },
                    ),
                  ),
                ),
              ),
              _isLost ? UserInfo() : UserInfofound(),
              SizedBox(height: 20),
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

  void _onOptionSelected(String option) {
    setState(() {
      _selectedOption = option;
      _isLost = option == 'Lost';
    });
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



class OptionButton extends StatelessWidget {
  final String label;
  final String selectedOption;
  final VoidCallback onTap;

  const OptionButton({
    Key? key,
    required this.label,
    required this.selectedOption,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black87; // Default text color
    Color buttonColor = Colors.transparent; // Default button color
    // Set text and button colors based on the selected option
    if (selectedOption == label) {
      textColor = label == 'Lost' ? Color(0xFFFF0E0E) : Color(0xFF5DB075);
      buttonColor = Colors.white;
    } else {
      textColor = Colors.grey[400]!;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 40, vertical: 6), // Reduced padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // Reduced border radius
          color: buttonColor,
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          // Center the text
          child: Text(
            label,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class OptionButtonFrame extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String) onSelect;

  const OptionButtonFrame({
    Key? key,
    required this.options,
    required this.selectedOption,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the width of each option button with reduced size
    final double optionWidth = MediaQuery.of(context).size.width /
        options.length *
        0.9; // Adjust the multiplier to reduce the size

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.grey[300]!,
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final option in options)
                SizedBox(
                  width: optionWidth,
                  child: OptionButton(
                    label: option,
                    selectedOption: selectedOption,
                    onTap: () => onSelect(option),
                  ),
                ),
            ],
          ),
        ),
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
                  backgroundImage: AssetImage('assets/Din.png'),
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
                          'Patapee_Din',
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
                'assets/dog.png',
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
                  Text('Name: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), // Added 3 tabs
                  SizedBox(width: 62),
                  Text('Rosie', style: TextStyle(color: Colors.black)),
                  Spacer(),
                  Text('Missing!!!',
                      style: TextStyle(color: Color(0xFFFF0E0E))),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Type: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), 
                  SizedBox(width: 69),
                  Text('Dog', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Breed: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), 
                  SizedBox(width: 64),
                  Text('Golden Retriever',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Gender: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), // Added 3 tabs
                  SizedBox(width: 54),
                  Text('Male', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Color: ', style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF26117A))),
                  SizedBox(width: 65),
                  Text('White', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Description: ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), 
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
                  backgroundImage: AssetImage('assets/Lom.png'),
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
                          'Wayupakk',
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
                'assets/Dog3.png',
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
                  Text('Name: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), // Added 3 tabs
                  SizedBox(width: 62),
                  Text('Stardust', style: TextStyle(color: Colors.black)),
                  Spacer(),
                  Text('found!!!',
                      style: TextStyle(color: Color(0xFF5DB075))),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Type: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), 
                  SizedBox(width: 69),
                  Text('Dog', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Breed: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), 
                  SizedBox(width: 64),
                  Text('German Shepherd',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Gender: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), // Added 3 tabs
                  SizedBox(width: 54),
                  Text('Male', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Color: ', style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF26117A))),
                  SizedBox(width: 65),
                  Text('Black/Brown', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 10),
                  Text('Description: ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A))), 
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
        ],
      ),
    );
  }
}