import 'package:curb/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images.dart';
import '../../../team_screen/hired_teams/hired_team_view.dart';
import '../../admin_auth/signup_auth/admin_signup_view/admin_signup_view.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Center(child: Text('Be a Boss of Software developers team', style: TextStyle(color: Colors.black, fontSize: 20),)),
            SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
               children: [
                 Container(
                   height: 250 , width: 180,
                   margin: EdgeInsets.symmetric(horizontal: 6),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadiusGeometry.circular(10),
                       color: Colors.blueGrey
                   ),
                   child: Column(
                     children: [
                       Container(
                         height: 200 , width: 180,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadiusGeometry.circular(10),
                             image: DecorationImage(image: AssetImage(AppImages.pic1), fit: BoxFit.fill)
                         ),
                       ),
                       SizedBox(height: 10,),
                       Text('Hire a Developer', style: TextStyle(color: Colors.white, fontSize: 20),),
                     ],
                   ),
                 ),
                 Container(
                   height: 250 , width: 180,
                   margin: EdgeInsets.symmetric(horizontal: 6),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadiusGeometry.circular(10),
                       color: Colors.blueGrey
                   ),
                   child: Column(
                     children: [
                       Container(
                         height: 200 , width: 180,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadiusGeometry.circular(10),
                             image: DecorationImage(image: AssetImage(AppImages.pic1), fit: BoxFit.fill)
                         ),
                       ),
                       SizedBox(height: 10,),
                       Text('Hire a Developer', style: TextStyle(color: Colors.white, fontSize: 20),),
                     ],
                   ),
                 ),
               ],
                           ),
            ),
            SizedBox(height: 20,),
            ListTile(
              title: Text('Recent Teams Hiring', style: TextStyle(color: Colors.black, fontSize: 20),),
              trailing: Icon(Icons.check_circle, color: Colors.greenAccent,)
            ),
            SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              itemCount: 8,
              itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    color: Colors.blueGrey.shade100
                ),
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage(AppImages.pic2),),
                    title: Text('Red Team by Joseph P.', style: TextStyle(color: Colors.black, fontSize: 20),),
                    subtitle: Text('2 yrs Contract', style: TextStyle(color: Colors.grey, fontSize: 16),),
                    trailing: Text('USA', style: TextStyle(color: Colors.grey, fontSize: 16),),
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
}


class UserBottomNav extends StatefulWidget {
  const UserBottomNav({super.key});

  @override
  State<UserBottomNav> createState() => _UserBottomNavState();
}

class _UserBottomNavState extends State<UserBottomNav> {
  int _currentIndex = 0;

  final List<String> _titles = [
    "Hired Teams",
    "Be Dark",
    "Meeting",
    "My Profile",
  ];

  final List<Widget> _pages = [
    HiredTeamsPage(),
    HiredTeamsPage(),
    MeetingPage(),
    MeetingPage(),
  ];

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const AdminSignupView()); // Clears all previous routes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // width: 100,
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: DrawerHeader(child: Column(
                children: [
                  Icon(FontAwesomeIcons.accusoft),
                  regularText(title: 'Developers Agency', textSize: 20, textColor: Colors.black),
                ],
              )),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                tileColor: Colors.grey.shade300,
                onTap: (){
                  Get.offNamed('/RTeamScreen');
                },
                title: regularText(title: 'Register team', textSize: 20, textColor: Colors.black),
                trailing: Icon(Icons.call_missed_outgoing, color: Colors.black,),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                tileColor: Colors.grey.shade300,
                onTap: (){
                  Get.offNamed('/FetchTeam');
                },
                title: regularText(title: 'List of teams', textSize: 20, textColor: Colors.black),
                trailing: Icon(Icons.call_missed_outgoing, color: Colors.black,),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300
              ),
              child: ListTile(
                title: Text('Logout App'),
                trailing: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: _logout,
                  // tooltip: "Logout",
                  
                ),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(_titles[_currentIndex], style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: "Hired Teams",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "King",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: "Meeting",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Be Dark', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    );
  }
}











































class MeetingPage extends StatelessWidget {
  const MeetingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Join a Meeting',
          style: TextStyle(fontSize: 22, color: Colors.deepPurple)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Your Profile Info',
          style: TextStyle(fontSize: 22, color: Colors.orange)),
    );
  }
}
