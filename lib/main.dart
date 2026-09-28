import 'package:flutter/material.dart';

void main() {
  runApp(const StudentCampusApp());
}

class StudentCampusApp extends StatelessWidget {
  const StudentCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Hub',

      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),

      home: const CampusHomePage(),
    );
  }
}

class CampusHomePage extends StatefulWidget {
  const CampusHomePage({super.key});

  @override
  State<CampusHomePage> createState() => _CampusHomePageState();
}

class _CampusHomePageState extends State<CampusHomePage> {

  // Controls BottomNavigationBar
  int currentIndex = 0;

  // Used for the FloatingActionButton
  int registeredActivities = 0;

  // Change page when BottomNavigationBar is clicked
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // Register for an activity
  void registerActivity() {
    setState(() {
      registeredActivities++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Activity registered successfully!'),
      ),
    );
  }

  // Home Page
  Widget homePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Welcome
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
            ),

            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'University of California, San Diego',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Welcome, Toshani!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Bachelors of Computer Science • Semester 5',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: Stack(
              children: [

                Image.asset(
                  'assets/campus.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,

                  child: Container(
                    padding: const EdgeInsets.all(16),

                    decoration: const BoxDecoration(
                      color: Colors.black54,
                    ),

                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Text(
                          'Explore Campus Life at UCSD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Announcement
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.notifications,
                color: Colors.indigo,
              ),
              title: const Text('Campus Announcement'),
              subtitle: const Text(
                'Registration for upcoming events is now open.',
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Campus services
          Row(
            children: [

              Expanded(
                child: quickAccessCard(
                  Icons.library_books,
                  'Library',
                  'Library selected',
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: quickAccessCard(
                  Icons.map,
                  'Campus Map',
                  'Campus Map selected',
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: quickAccessCard(
                  Icons.calendar_month,
                  'Calendar',
                  'Calendar selected',
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: quickAccessCard(
                  Icons.restaurant,
                  'Cafeteria',
                  'Cafeteria selected',
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Upcoming Activities',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          activityCard(
            'Gene Classification Workshop',
            '24 September 2026',
            'Computer Lab',
            'assets/workshop.jpg',
          ),

          activityCard(
            'Career Fair',
            '28 September 2026',
            'Main Hall',
            'assets/career.jpg',
          ),

          activityCard(
            'UCSD Tritons VS. UCLA Bruins',
            '2 October 2026',
            'Basketball Stadium',
            'assets/sports.jpg',
          ),
        ],
      ),
    );
  }
  Widget quickAccessCard(
      IconData icon,
      String title,
      String message,
      ) {
    return GestureDetector(
      onTap: () {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );

      },

      child: Container(
        height: 110,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.1),
                shape: BoxShape.circle,
              ),

              child: Icon(
                icon,
                size: 28,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Activity Card
  Widget activityCard(
      String title,
      String date,
      String location,
      String image,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          // Activity image
          Image.asset(
            image,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 18,
                      color: Colors.indigo,
                    ),

                    const SizedBox(width: 6),

                    Text(date),
                  ],
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 18,
                      color: Colors.indigo,
                    ),

                    const SizedBox(width: 6),

                    Text(location),
                  ],
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: registerActivity,

                    child: const Text(
                      'Register',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // Activities Page
  Widget activitiesPage() {
    return ListView(
      padding: const EdgeInsets.all(16),

      children: [

        const Text(
          'Campus Activities',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Discover upcoming events and activities on campus.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 20),

        activityCard(
          'Programming Workshop',
          '24 September 2026',
          'Computer Lab',
          'assets/workshop.jpg',
        ),

        activityCard(
          'Career Fair',
          '28 September 2026',
          'Main Hall',
          'assets/career.jpg',
        ),

        activityCard(
          'Sports Competition',
          '2 October 2026',
          'Sports Centre',
          'assets/sports.jpg',
        ),

        activityCard(
          'Photography Club',
          '5 October 2026',
          'Student Centre',
          'assets/campus.jpg',
        ),
      ],
    );
  }

  // Profile Page
  Widget profilePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [

          // Profile picture
          const CircleAvatar(
            radius: 55,

            backgroundImage: AssetImage(
              'assets/profile.jpg',
            ),
          ),

          const SizedBox(height: 15),

          // Student name
          const Text(
            'Toshani Barama',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Bachelor of Computer Science, Minor in Cognitive Science',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 25),

          // Student information
          Card(
            elevation: 1,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),

            child: Column(
              children: [

                profileInfo(
                  Icons.badge,
                  'Student ID',
                  '2026123456',
                ),

                profileInfo(
                  Icons.school,
                  'Programme',
                  'Bachelor of Computer Science',
                ),

                profileInfo(
                  Icons.email,
                  'Email',
                  'tbarama@ucsd.edu',
                ),

                profileInfo(
                  Icons.calendar_month,
                  'Semester',
                  'Semester 5',
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // Registered activities
          Card(
            elevation: 1,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Row(
                children: [

                  Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.event_available,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      const Text(
                        'Activities Registered',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        '$registeredActivities',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget profileInfo(
      IconData icon,
      String title,
      String value,
      ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.1),
          shape: BoxShape.circle,
        ),

        child: Icon(
          icon,
          color: Colors.indigo,
        ),
      ),

      title: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),

      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    // Select which page to display
    Widget currentPage;

    if (currentIndex == 0) {
      currentPage = homePage();
    } else if (currentIndex == 1) {
      currentPage = activitiesPage();
    } else {
      currentPage = profilePage();
    }

    return Scaffold(

      // =========================
      // APP BAR
      // =========================

      appBar: AppBar(
        title: const Text('UCSD Campus Portal'),

        actions: [

          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No new notifications'),
                ),
              );

            },
          ),
        ],
      ),

      // =========================
      // DRAWER
      // =========================

      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,

          children: [

            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Toshani Barama',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'B.S. Computer Science',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),

              onTap: () {
                setState(() {
                  currentIndex = 0;
                });

                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Activities'),

              onTap: () {
                setState(() {
                  currentIndex = 1;
                });

                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),

              onTap: () {
                setState(() {
                  currentIndex = 2;
                });

                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),

              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Settings selected'),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),

              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Help Centre selected'),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // =========================
      // MAIN BODY
      // =========================

      body: currentPage,

      // =========================
      // FLOATING ACTION BUTTON
      // =========================

      floatingActionButton: FloatingActionButton(
        onPressed: registerActivity,

        tooltip: 'Register Activity',

        child: const Icon(Icons.add),
      ),

      // =========================
      // BOTTOM NAVIGATION
      // =========================

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,

        onTap: changePage,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Activities',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}