import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/components/profile/buttomSheetElement.dart';

class EditProfile extends StatelessWidget {
  final Map userData;
  const EditProfile({required this.userData});

  @override
  Widget build(BuildContext context) {
    var imageData = '${userData["imageUrl"]}'.obs;
    final nameController = TextEditingController(text: '${userData["name"]}');
    final bioController = TextEditingController(text: '${userData["bio"]}');
    var imageFilePath = ''.obs;
    // var imageFileSize="".obs;

    final picker = ImagePicker();
    chooseImage(ImageSource source) async {
      final pickedFile = await picker.pickImage(source: source);
      // ignore: unnecessary_null_comparison
      if (pickedFile != null) {
        imageFilePath.value = pickedFile.path;
      } else {
        Get.snackbar(
          "errorr",
          "message",
        );
      }
      //  imageFileSize.value=pickedFile.path;
    }

    bottomSheetImagePicker() {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtomShettElements(
                      icon: Icons.camera,
                      title: "camera",
                      onPress: () {
                        chooseImage(ImageSource.camera);
                      }),
                  ButtomShettElements(
                      icon: Icons.grid_on_outlined,
                      title: "gallery",
                      onPress: () {
                        chooseImage(ImageSource.gallery);
                      }),
                ],
              ),
            );
          });
    }

    Widget inputTextCreator(String labelText, controller) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Align(
            alignment: Alignment.topLeft,
            child: TextField(
              controller: controller,
              obscureText: false,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: labelText,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            )),
      );
    }

    Widget avatarContainer(src, double number) {
      return imageFilePath == ""
          ? Container(
              width: number,
              height: number,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(src),
                ),
              ),
            )
          : Container(
              width: number,
              height: number,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(File(imageFilePath.value)),
                ),
              ),
            );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Colors.black,
                    )),
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check,
                  color: Colors.blueAccent,
                  size: 30,
                )),
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(12),
        child: Obx(() {
          return Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    avatarContainer(imageData.toString(), 100.0),
                    TextButton(
                        onPressed: bottomSheetImagePicker,
                        child: Text("Change Profile Photo"))
                  ],
                ),
              ),
              inputTextCreator("name", nameController),
              inputTextCreator("bio", bioController),
            ],
          );
        }),
      )),
    );
  }
}
