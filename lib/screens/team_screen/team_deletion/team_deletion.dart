import 'package:curb/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteTeamView extends StatelessWidget {
  const DeleteTeamView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final String teamId = args['teamId'] ?? '';
    final String teamName = args['teamName'] ?? '';

    if (teamId.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Delete Team'),
          backgroundColor: Colors.red,
        ),
        body: const Center(
          child: Text(
            'No Team ID provided!',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: regularText(title: 'Delete $teamName team', textSize: 20, textColor: Colors.white),
        backgroundColor: Colors.blueGrey,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning_amber_rounded,
                color: Colors.red, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Are you sure you want to permanently delete your team?\n\nThis action cannot be undone.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel Button
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: regularText(title: 'Cancel ', textSize: 18, textColor: Colors.black),
                  ),
                ),
                // Delete Button
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
                    ),
                    onPressed: () async {
                      await _deleteTeam(teamId);
                    },
                    child: regularText(title: 'Delete Team', textSize: 18, textColor: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteTeam(String teamId) async {
    try {
      await FirebaseFirestore.instance
          .collection('teams') // Your main collection
          .doc(teamId)
          .delete();

      Get.snackbar(
        'Deleted',
        'Team has been permanently deleted',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.back(); // Go back after deletion
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete team: $e',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
