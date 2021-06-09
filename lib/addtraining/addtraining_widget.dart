import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddtrainingWidget extends StatefulWidget {
  AddtrainingWidget({Key key}) : super(key: key);

  @override
  _AddtrainingWidgetState createState() => _AddtrainingWidgetState();
}

class _AddtrainingWidgetState extends State<AddtrainingWidget> {
  String uploadedFileUrl;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFD54F00),
        automaticallyImplyLeading: true,
        title: Text(
          'Add training',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final imagePath = uploadedFileUrl;
              final name = textController1.text;
              final instruction = textController2.text;
              final calories = double.parse(textController3.text);

              final trainingsRecordData = createTrainingsRecordData(
                imagePath: imagePath,
                name: name,
                instruction: instruction,
                calories: calories,
              );

              await TrainingsRecord.collection.doc().set(trainingsRecordData);
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => NavBarPage(initialPage: 'Account_Page'),
                ),
                (r) => false,
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.check,
              color: Colors.black,
              size: 20,
            ),
            iconSize: 20,
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: textController1,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'name',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                ),
              ),
              TextFormField(
                controller: textController2,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'instructions',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                ),
              ),
              TextFormField(
                controller: textController3,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'calories',
                  hintStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                ),
              ),
              InkWell(
                onTap: () async {
                  final selectedMedia = await selectMedia();
                  if (selectedMedia != null &&
                      validateFileFormat(selectedMedia.storagePath, context)) {
                    showUploadMessage(context, 'Uploading file...',
                        showLoading: true);
                    final downloadUrl = await uploadData(
                        selectedMedia.storagePath, selectedMedia.bytes);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    if (downloadUrl != null) {
                      setState(() => uploadedFileUrl = downloadUrl);
                      showUploadMessage(context, 'Success!');
                    } else {
                      showUploadMessage(context, 'Failed to upload media');
                    }
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                      icon: Icon(
                        Icons.add_box_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      iconSize: 30,
                    ),
                    Text(
                      'Image',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
