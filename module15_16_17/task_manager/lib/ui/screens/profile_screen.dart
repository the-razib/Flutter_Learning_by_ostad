import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_manager_app_ber.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBer(isProfileOpen: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Get Started With',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            buildPhotoPicker(),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(hintText: 'First Name '),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Last Name'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Phone'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.arrow_forward_outlined))
          ],
        ),
      ),
    );
  }

  Widget buildPhotoPicker() {
    return Container(
      height: 50,
      width: 500,
      color: Colors.white,
      child: Row  (
        children: [
          Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: const Text(
              'Photo',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Text('Selected Photo')
        ],
      ),

    );
  }
}
