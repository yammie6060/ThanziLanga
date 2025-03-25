import 'package:flutter/material.dart';
import 'dart:async';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeContentScreen(),
      const AppointmentsScreen(),
      const ProfileScreen(),
      ConsultantsScreen(),
    ];
  }

  final List<String> _appBarTitles = [
    '\t Thanzilanga+',
    '\t Appointments',
    '\t Profile',
    '\t Assistant',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex != 3
          ? AppBar(
        backgroundColor: const Color(0xFF3F9AF4),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          _appBarTitles[_currentIndex],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.notification_add_outlined, color: Colors.white),
              iconSize: 30,
              onPressed: () =>Navigator.push(
              context,
    MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              ),
            ),

          ),
          Builder(builder: (context) =>IconButton(
              icon: const Icon(Icons.person_pin, color: Colors.white,),
              iconSize: 30,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
          ),
        ],
      ) : null,
      endDrawer: _buildDrawer(context),
      body: _screens[_currentIndex],
      bottomNavigationBar: _currentIndex != 3
          ? BottomNavigationBar(
        iconSize: 30,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFFEEEFF1),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            activeIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            activeIcon: Icon(Icons.calendar_today_rounded),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_rounded),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_outlined),
            activeIcon: Icon(Icons.person_search_rounded),
            label: 'Assistant',
          ),
        ],
      )
          : null,
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF3F9AF4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Color(0xFF3F9AF4), size: 30),
                ),
                const SizedBox(height: 10),
                const Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFF3F9AF4)),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF3F9AF4)),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Color(0xFF3F9AF4)),
            title: const Text('Languages'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFFFF6B6B)),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                _buildWelcomeMessage(),
                const SizedBox(height: 8),
                _buildBannerSection(),
                const SizedBox(height: 24),
                _buildServicesSection(context),
                const SizedBox(height: 24),
                _buildAssistantsSection(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome,',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: Color(0xFF333333),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '\t your health matters',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.2,
              color: Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerSection() {
    final PageController _pageController = PageController();
    List<Widget> pages = [
      Container(
        color: const Color(0xFF3F9AF4).withOpacity(0.1),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.health_and_safety, size: 48, color: Color(0xFF3F9AF4)),
              SizedBox(height: 16),
              Text(
                'Health Tips & Services',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        color: const Color(0xFF6FCFAA).withOpacity(0.1),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.medical_services, size: 48, color: Color(0xFF6FCFAA)),
              SizedBox(height: 16),
              Text(
                'Book Appointments',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        color: const Color(0xFF3F9AF4).withOpacity(0.1),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_hospital, size: 48, color: Color(0xFF3F9AF4)),
              SizedBox(height: 16),
              Text(
                'Emergency Services',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
      ),
    ]; // Dynamic list of pages

    int totalPages = pages.length;
    int _currentPage = 0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        if (_pageController.hasClients) {
          final nextPage = _currentPage + 1;

          if (nextPage < totalPages) {
            _pageController.animateToPage(
              nextPage,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          } else {
            _pageController.jumpToPage(0); // Restart from first page
          }

          _currentPage = (nextPage < totalPages) ? nextPage : 0;
        }
      });
    });

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                // PageView with the controller
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: pages,
                ),

                // Page indicator dots at the bottom
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      totalPages,
                          (index) => _buildIndicator(index, _currentPage),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// Helper method to build indicator dots
  Widget _buildIndicator(int index, int currentPage) {
    bool isActive = index == currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF08C8E8) : const Color(0xFFCCCCCC),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {'title': 'Stock', 'icon': Icons.inventory, 'color': const Color(
          0xFF6FC4FF)},
      {'title': 'Pharmacies', 'icon': Icons.local_pharmacy, 'color': const Color(
          0xFF6FC4DF)},
      {'title': 'Hospitals', 'icon': Icons.local_hospital, 'color': const Color(0xFF6FC4FF)},
      {'title': 'Clinics', 'icon': Icons.medical_services, 'color': const Color(0xFF6FC4EF)},
      {'title': 'Labs', 'icon': Icons.science, 'color': const Color(0xFF6FC4DF)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllServicesScreen()),
                );
              },
              borderRadius: BorderRadius.circular(4),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  'View all',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F9AF4)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 24),
            children: services.map((service) =>
                _buildCategoryCard(service['title'], service['icon'], service['color'])
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAssistantsSection(BuildContext context) {
    final List<Map<String, dynamic>> assistants = [
      {'name': 'Christobel Khondiwa', 'specialization': 'Dentist', 'color': const Color(0xFF3F9AF4)},
      {'name': 'Enock Makhwalu', 'specialization': 'Pharmacist', 'color': const Color(0xFF3F9AF4)},
      {'name': 'Njewa Chifundo', 'specialization': 'Cardiologist', 'color': const Color(0xFF3F9AF4)},
      {'name': 'Joseph Nhlane', 'specialization': 'Midwife', 'color': const Color(0xFF3F9AF4)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Health Assistants",
              style: TextStyle(
                fontSize: 14, // Adjusted for consistency
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllAssistantsScreen()),
                );
              },
              borderRadius: BorderRadius.circular(4),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3F9AF4),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 24),
            children: assistants.map((assistant) =>
                _buildAssistantCard(assistant['name'], assistant['specialization'], assistant['color'])
            ).toList(),
          ),
        ),
      ],
    );
  }


  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 30),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAssistantCard(String name, String specialization, Color color) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 40,
                child: Text(
                  name[0],
                  style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333)),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                specialization,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const Center(
        child: Text(
          'Appointments Screen',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }
}
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const Center(
        child: Text(
          'Notifications Screen',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }
}

class ConsultantsScreen extends StatefulWidget {
  const ConsultantsScreen({Key? key}) : super(key: key);

  @override
  _ConsultantsScreenState createState() => _ConsultantsScreenState();
}

class _ConsultantsScreenState extends State<ConsultantsScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = []; // List to store chat messages

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _messages.add(_textController.text); // Add the message to the list
        _textController.clear(); // Clear the input field
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F9AF4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text(
          'Assistant',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? const Center(
              child: Text(
                'type in your symptoms',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF3F9AF4).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF3F9AF4).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF333333),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type your symptoms...',
                hintStyle: const TextStyle(color: Color(0xFF666666)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF3F9AF4),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}

class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F9AF4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'All Services',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // this is just for demonstration but everything will be retrieved from the backend (database)
          _buildServiceTile('Stock', Icons.inventory, const Color(0xFF6FC4FF)),
          _buildServiceTile('Pharmacies', Icons.local_pharmacy, const Color(0xFF6FC4DF)),
          _buildServiceTile('Hospitals', Icons.local_hospital, const Color(0xFF6FC4FF)),
          _buildServiceTile('Clinics', Icons.medical_services, const Color(0xFF6FC4EF)),
          _buildServiceTile('Labs', Icons.science, const Color(0xFF6FC4DF)),
        ],
      ),
    );
  }

  Widget _buildServiceTile(String title, IconData icon, Color color) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF666666)),
        onTap: () {
          // Handle tap on a service
        },
      ),
    );
  }
}

class AllAssistantsScreen extends StatelessWidget {
  const AllAssistantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F9AF4), // Deep Blue
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'All Health Assistants',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      backgroundColor: Colors.grey[100],
      body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // will be retrieved from the database, this is just for presentation
            _buildAssistantTile('Christobel Khondiwa', 'Dentist', const Color(0xFF3F9AF4)),
            _buildAssistantTile('Enock Makhwalu', 'Pharmacist', const Color(0xFF3F9AF4)),
            _buildAssistantTile('Njewa Chifundo', 'Cardiologist', const Color(0xFF3F9AF4)),
            _buildAssistantTile('Joseph Nhlane', 'Midwife', const Color(0xFF3F9AF4)),
          ]
      ),
    );
  }

  Widget _buildAssistantTile(String name, String specialization, Color color) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: color,
          radius: 24,
          child: Text(
            name[0],
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),

        subtitle: Text(
          specialization,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF666666),
          ),
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF666666)),
        onTap: () {
          // Handle tap on an assistant
        },
      ),
    );
  }
}