import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/teamR_controller.dart';

class TeamListScreen extends StatelessWidget {
  final TeamRController teamController = Get.put(TeamRController());

  @override
  Widget build(BuildContext context) {
    teamController.fetchTeams();

    return Scaffold(
      appBar: AppBar(title: Text("Registered Teams")),
      body: Obx(() {
        if (teamController.teams.isEmpty) {
          return Center(child: Text("No teams registered yet."));
        }
        return ListView.builder(
          itemCount: teamController.teams.length,
          itemBuilder: (context, index) {
            final team = teamController.teams[index];
            return Column(
              children: [
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


                Card(
                  margin: EdgeInsets.all(8),
                  child: Container(
                    height: 180, width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: MemoryImage(base64Decode(team.imageBase64)), fit: BoxFit.fill)
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
