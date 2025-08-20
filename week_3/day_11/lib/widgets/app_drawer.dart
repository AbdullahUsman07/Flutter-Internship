import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_11/screens/landing_screen.dart';
import 'package:day_11/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection("users").doc(user?.uid).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>?;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                ),
                accountName: Text(userData?['username'] ?? "Guest User"),
                accountEmail: Text(userData?['email'] ?? "No email"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: const Color(0xFFBDE6FB), 
                  child: Text(
                    (userData?['username'] != null && userData!['username'].isNotEmpty)
                        ? userData['username'][0].toUpperCase()
                        : "?",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.deleteAll();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LandingScreen()),
                    (route) => false,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}