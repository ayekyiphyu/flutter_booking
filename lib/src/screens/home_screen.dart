import 'package:flutter/material.dart';
import 'package:yoyaku_app/src/screens/calender_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.book_outlined, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Easy Booking App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, // Change the app bar color
        centerTitle: false,
        elevation: 0, // Remove the shadow effect (optional)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Top margin and centering the GridView
            const SizedBox(height: 32), // Adjust margin from the top

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0), // Top margin
                child: GridView.count(
                  crossAxisCount: 2, // Set number of columns
                  crossAxisSpacing: 16, // Horizontal gap between buttons
                  mainAxisSpacing: 16, // Vertical gap between buttons
                  childAspectRatio: 3, // Set button aspect ratio
                  shrinkWrap: true, // To prevent scrolling within GridView
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add your booking action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors
                                .lightGreen
                                .shade900, // Custom background color
                        foregroundColor: Colors.white, // White text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Remove border radius
                        ),
                      ),
                      child: const Text('予約する'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Your action for 'Detail Page' here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red.shade900, // Custom background color
                        foregroundColor: Colors.white, // White text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Remove border radius
                        ),
                      ),
                      child: const Text('一覧表示'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Your action for 'Two Button' here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors
                                .lightBlue
                                .shade900, // Custom background color
                        foregroundColor: Colors.white, // White text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Remove border radius
                        ),
                      ),
                      child: const Text('お問い合せ'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to CalendarScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalendarScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors
                                .lightBlue
                                .shade900, // Custom background color
                        foregroundColor: Colors.white, // White text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Remove border radius
                        ),
                      ),
                      child: const Text('カレンダー表示'),
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
