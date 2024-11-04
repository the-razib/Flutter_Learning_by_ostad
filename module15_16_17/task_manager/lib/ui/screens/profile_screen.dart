import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/centerted_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snackber_message.dart';
import 'package:task_manager/ui/widgets/task_manager_app_ber.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  bool _updateProfileInProgress = false;
  XFile? _selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setUserData();
    super.initState();
  }

  void setUserData() {
    _emailTEController.text = AuthController.userdata?.email ?? ' ';
    _firstNameTEController.text = AuthController.userdata?.firstName ?? ' ';
    _lastNameTEController.text = AuthController.userdata?.lastName ?? ' ';
    _phoneTEController.text = AuthController.userdata?.mobile ?? ' ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBer(isProfileOpen: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  enabled: false,
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name '),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter first name';
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter last name';
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneTEController,
                  decoration: const InputDecoration(hintText: 'Phone'),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter phone number';
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: _updateProfileInProgress==false,
                  replacement: CentertedCircularProgressIndicator(),
                  child: ElevatedButton(
                      onPressed: _onTabUpdateProfile,
                      child: const Icon(Icons.arrow_forward_outlined)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPhotoPicker() {
    return GestureDetector(
      onTap: () {
        _pickedImage();
      },
      child: Container(
        height: 50,
        width: 500,
        color: Colors.white,
        child: Row(
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
            FittedBox(child: Text(_selectedImageTitle()))
          ],
        ),
      ),
    );
  }

  String _selectedImageTitle() {
    if (_selectedImage != null) {
      return _selectedImage!.name;
    }
    return 'Select Photo';
  }

  void _onTabUpdateProfile() {
    if (_formKey.currentState!.validate()) {
      _updateProfile();
    }
  }

  Future<void> _updateProfile() async {
    _updateProfileInProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _phoneTEController.text,
    };
    if (_passwordTEController.text != null) {
      requestBody['password'] = _passwordTEController.text;
    }
    if (_selectedImage != null) {
      List<int> imageByte = await _selectedImage!.readAsBytes();
      String convertedImage = base64Encode(imageByte);
      requestBody['photo'] = convertedImage;
    }
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.profileUpdate,
      body: requestBody,
    );

    _updateProfileInProgress = false;
    setState(() {});

    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(requestBody);
      showSnackBerMessage(context, 'Profile Updated Successfully');
    } else {
      showSnackBerMessage(context, response.errorMessage);
    }
  }

  Future<void> _pickedImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _selectedImage = pickedImage;
      setState(() {});
    }
  }
}
