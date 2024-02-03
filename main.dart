import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Cat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedOption = 'notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set app bar background color to white
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black), // Set app bar title text color to black
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/notification_icon.png', // Replace with your image asset path
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Add functionality for notification icon
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20), // Add space between Lost/Found buttons and search field
          OptionButtonFrame(
            options: ['Lost', 'Found'],
            selectedOption: _selectedOption,
            onSelect: (option) {
              setState(() {
                _selectedOption = option;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding for text field content
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50), // Set border radius to make it long oval
                  borderSide: BorderSide.none, // Hide the border side
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
          UserInfo(), // Display user info
          SizedBox(height: 20), // Add space between user info and contact button
        ],
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
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6), // Reduced padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // Reduced border radius
          color: buttonColor,
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center( // Center the text
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
    final double optionWidth = MediaQuery.of(context).size.width / options.length * 0.9; // Adjust the multiplier to reduce the size

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
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF26117A)),
                        ),
                        Spacer(),
                        Text(
                          '...',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
                  Text('Name: ', style: TextStyle(color: Color(0xFF26117A))),
                  Text('Percy', style: TextStyle(color: Colors.black)),
                  Spacer(),
                  Text('Missing!!!', style: TextStyle(color: Color(0xFFFF0E0E))),
                ],
              ),
              Row(
                children: [
                  Text('Type: ', style: TextStyle(color: Color(0xFF26117A))),
                  Text('Cat', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  Text('Breed: ', style: TextStyle(color: Color(0xFF26117A))),
                  Text('Domestic Shorthair', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  Text('Gender: ', style: TextStyle(color: Color(0xFF26117A))),
                  Text('Male', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  Text('Color: ', style: TextStyle(color: Color(0xFF26117A))),
                  Text('White/Orange', style: TextStyle(color: Colors.black)),
                ],
              ),
              Row(
                children: [
                  Text('Description: ', style: TextStyle(color: Color(0xFF26117A))),
                  Text('...', style: TextStyle(color: Colors.black)),
                ],
              ),
              SizedBox(height: 5),
              Text('8 m ago', style: TextStyle(color: Color(0xFF979797), fontSize: 12)),
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