import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logii/Constants/Constants.dart';
import 'package:image_cropper/image_cropper.dart';
import '../Services/DatabaseServices.dart';

class EditProfilImage extends StatefulWidget {
  final DocumentSnapshot snapshot;
  final String visitedUserId;
  final String coverLink;
  final String profilLink;
  final String imageType;

  const EditProfilImage(
      {Key key,
      this.snapshot,
      this.visitedUserId,
      this.coverLink,
      this.profilLink,
      this.imageType})
      : super(key: key);
  @override
  _EditProfilImageState createState() => _EditProfilImageState();
}

class _EditProfilImageState extends State<EditProfilImage> {
  File _image;
  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source, imageQuality: 50);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _cropImage(_image);
    }
  }

  _cropImage(File picked) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.red,
        toolbarColor: Colors.red,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      maxWidth: 800,
    );
    if (cropped != null) {
      if (this.mounted) {
        setState(() {
          _image = cropped;
        });
      }
      Navigator.pop(context);
    }

    if (widget.imageType == 'profile') {
      DatabaseServices.uploadProfilPhoto(
          _image, widget.visitedUserId);
    } else if (widget.imageType == 'cover') {
      DatabaseServices.uploadCoverPhoto(
          _image, widget.visitedUserId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null
            ? new Image.network(widget.profilLink)
            : Image.file(_image),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        closeManually: false,
        backgroundColor: LogiColor,
        curve: Curves.easeIn,
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera_alt),
            label: 'Take now',
            backgroundColor: Colors.yellow,
            onTap: () {
              getImage(ImageSource.camera);
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.select_all_sharp),
            label: 'Select gallery',
            backgroundColor: Colors.red,
            onTap: () {
              getImage(ImageSource.gallery);
            },
          )
        ],
      ),
    );
  }
}
