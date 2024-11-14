import 'package:flutter/material.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/profile_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';

class TaskManagerAppBer extends StatelessWidget implements PreferredSizeWidget {
  const TaskManagerAppBer({
    super.key,  this.isProfileOpen=false,
  });
  final bool isProfileOpen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(isProfileOpen){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      },
      child: AppBar(
        backgroundColor: AppColor.themeColor,
        title: Row(
          children: [
            const CircleAvatar(radius: 16),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userdata?.fullName ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    AuthController.userdata?.email ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () async {
                  await AuthController.clearUserData();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
