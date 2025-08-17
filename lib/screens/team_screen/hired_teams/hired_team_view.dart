import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../widgets/rteam_btn.dart';
import '../team_deletion/team_deletion.dart';
import '../team_registration/controller/teamR_controller.dart';


class HiredTeamsPage extends StatelessWidget {
  final TeamRController teamController = Get.put(TeamRController());

  HiredTeamsPage({super.key});
  @override
  Widget build(BuildContext context) {
    teamController.fetchTeams();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(backgroundColor: Colors.blueGrey,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Hire the team you afford at your best price', style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SearchBar(hintText: 'Search your team',),
              ),
          
              /// sales team
          
             // CustomTeamWidget(),
          
              /// closing sales team
              SizedBox(height: 20,),
              Obx(() {
                if (teamController.teams.isEmpty) {
                  return Center(child: Text("No teams registered yet."));
                }
                return ListView.builder(
                  itemCount: teamController.teams.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final team = teamController.teams[index];
                    return Column(

                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: MemoryImage(base64Decode(team.imageBase64)),
                          ),
                          title: Text(team.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email: ${team.email}"),
                              Text("Contact: ${team.contact}"),
                              Text("Address: ${team.address}"),
                            ],
                          ),
                          trailing: Icon(Icons.check_circle, color: Colors.green),
                        ),

                        // ListTile(
                        //   leading: CircleAvatar(
                        //     backgroundImage: MemoryImage(base64Decode(team.imageBase64)),
                        //   ),
                        //   title: Text(team.name),
                        //   subtitle: Text(team.address),
                        //   trailing: Icon(Icons.check_circle, color: Colors.green),
                        //   onTap: () {
                        //     Get.snackbar("Team Selected", team.name);
                        //   },
                        // ),
                        GestureDetector(
                          onTap:(){
                            Get.to(() => const DeleteTeamView(), arguments: {
                              'teamId': team.id,
                              'teamName': team.name// Firestore document ID
                            });

                          },
                          child: Container(
                            height: 220,
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: MemoryImage(base64Decode(team.imageBase64)), fit: BoxFit.fill)
                            ),
                          ),
                        ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           RteamBtns(
                             onClick: (){
                               Get.offNamed(
                                  '/TeamContact',
                                  arguments: {
                                    'teamName': team.name,
                                    'teamEmail': team.email,
                                    'teamAddress': team.address,
                                    'teamContact': team.contact,
                                    'teamId': team.id
                                  },
                               );
                             },
                             btnHeight: 46, btnWidth: 160,
                             btnColor: Colors.grey.shade300,
                             btnTitle: 'Contact Team',
                             btnIcon: Icons.verified_rounded,
                           ),
                           SizedBox(width: 10,),
                           RteamBtns(
                             onClick: (){
                               Get.offNamed('/TeamProfile');
                             },
                             btnHeight: 46, btnWidth: 160,
                             btnColor: Colors.grey.shade300,
                             btnTitle: 'Team Portfolio',
                             btnIcon: FontAwesomeIcons.userNinja,
                           ),
                         ],
                       ),

                        //
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //       height: 40 , width: 166,
                        //       // margin: EdgeInsets.symmetric(horizontal: 8),
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadiusGeometry.circular(10),
                        //           color: Colors.blueGrey.shade100
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         spacing: 16,
                        //         children: [
                        //           Icon(Icons.verified_rounded, color: Colors.deepPurple,),
                        //           Text('Contact Team', style: TextStyle(fontSize: 16,
                        //               color: Colors.black, fontFamily: 'Times New Roman'),),
                        //         ],
                        //       ),
                        //     ),
                        //    Container(
                        //         height: 40 , width: 166,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadiusGeometry.circular(10),
                        //             color: Colors.blueGrey.shade100
                        //         ),
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           spacing: 16,
                        //           children: [
                        //             Icon(Icons.verified_rounded, color: Colors.deepPurple,),
                        //             Text('Visit Portfolio', style: TextStyle(fontSize: 16,
                        //                 color: Colors.black, fontFamily: 'Times New Roman'),),
                        //           ],
                        //         ),
                        //       ),
                        //
                        //   ],
                        // ),

                        SizedBox(height: 50,)

                      ],
                    );
                  },
                );
              }),
          
            ],
          ),
        ),
      ),
    );
  }

}