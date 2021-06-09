import '../addmeal/addmeal_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../deteils_meals/deteils_meals_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsPageWidget extends StatefulWidget {
  MealsPageWidget({Key key}) : super(key: key);

  @override
  _MealsPageWidgetState createState() => _MealsPageWidgetState();
}

class _MealsPageWidgetState extends State<MealsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF670974),
        automaticallyImplyLeading: true,
        title: Text(
          'All meals',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddmealWidget(),
            ),
          );
        },
        backgroundColor: Color(0xFF670974),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.tertiaryColor,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<MealsRecord>>(
                stream: queryMealsRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<MealsRecord> listViewMealsRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (listViewMealsRecordList.isEmpty) {
                    return Image.network(
                      '',
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewMealsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewMealsRecord =
                          listViewMealsRecordList[listViewIndex];
                      return StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          final cardUsersRecord = snapshot.data;
                          return Padding(
                            padding: EdgeInsets.fromLTRB(1, 10, 0, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DeteilsMealsWidget(mealsRecord: listViewMealsRecord),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                listViewMealsRecord.imagePath,
                                            width: double.infinity,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          listViewMealsRecord.name,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            listViewMealsRecord.mealTime,
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          ' Calories: ',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        Text(
                                          listViewMealsRecord.calories
                                              .toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Time: ',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Text(
                                          listViewMealsRecord.timeTaken,
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      listViewMealsRecord.preparation,
                                      textAlign: TextAlign.start,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            final usersRecordData = {
                                              'selected_meals':
                                                  FieldValue.arrayUnion([
                                                listViewMealsRecord.reference
                                              ]),
                                            };

                                            await cardUsersRecord.reference
                                                .update(usersRecordData);
                                          },
                                          icon: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.black,
                                            size: 36,
                                          ),
                                          iconSize: 36,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
