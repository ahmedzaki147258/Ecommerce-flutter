import 'dart:io';
import 'package:admin_app/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

inageUploadCamera() async{
  final PickedFile? file = await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 100);

  if(file != null){
    return File(file.path);
  } else{
    return null;
  }
}

fileUploadGallery([isSvg = false]) async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg? [
      "svg"
    ] : [
      "png","jpg","jpeg","gif"
    ]
  );

  if(result != null){
    return File(result.files.single.path!);
  } else{
    return null;
  }
}

showbottommenu(inageUploadCamera(), fileUploadGallery()){
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Choose Image', style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),),
            const Padding(padding: EdgeInsets.only(top: 10)),
          ListTile(
              onTap: (){inageUploadCamera();Get.back();},
              leading: const Icon(Icons.camera_alt_outlined, size: 40,),
              title: const Text("from Camera", style: TextStyle(fontSize: 20),),
            ),
            ListTile(
              onTap: (){fileUploadGallery();Get.back();},
              leading: const Icon(Icons.image, size: 40,),
              title: const Text("from Gallery", style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    ),
     backgroundColor: Colors.white
  );
}