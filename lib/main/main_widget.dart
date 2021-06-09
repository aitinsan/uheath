import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../deteils_meals/deteils_meals_widget.dart';
import '../deteils_trainings/deteils_trainings_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Future<double> CalcAllEatCalories(UsersRecord mainUsersRecord) async {
  List<DocumentReference> documentLists =
      mainUsersRecord.selectedMeals.toList();
  double allSum = 0;
  for (var i = 0; i < documentLists.length; i++) {
    String pathTo = documentLists[i].path;
    DocumentSnapshot document =
        await FirebaseFirestore.instance.doc(pathTo).get();
    allSum += document.get('calories');
  }

  return allSum;
}

Future<double> CalcAllTrainCalories(UsersRecord mainUsersRecord) async {
  List<DocumentReference> documentLists =
      mainUsersRecord.selectedTrainings.toList();
  double allSum = 0;
  for (var i = 0; i < documentLists.length; i++) {
    String pathTo = documentLists[i].path;
    DocumentSnapshot document =
        await FirebaseFirestore.instance.doc(pathTo).get();
    allSum += document.get('calories');
  }

  return allSum;
}



class MainWidget extends StatefulWidget {
  MainWidget({
    Key key,

  }) : super(key: key);

  

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final mainUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                child: AutoSizeText(
                                  mainUsersRecord.displayName,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                mainUsersRecord.email,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF9E9E9E),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Eat Calories - ',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      mainUsersRecord.eatCalories.toString(),
                                      textAlign: TextAlign.end,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Train Calories -',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      mainUsersRecord.trainCalories.toString(),
                                      textAlign: TextAlign.end,
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment(1, 0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                imageUrl: mainUsersRecord.photoUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Color(0xFF607D8B),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Your Meals',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(),
                          child: ForFutureLearn(mainUsersRecors: mainUsersRecord,)
                          
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Builder(
                      builder: (context) {
                        final meals =
                            mainUsersRecord.selectedMeals?.toList() ?? [];
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: meals.length,
                            itemBuilder: (context, mealsIndex) {
                              final mealsItem = meals[mealsIndex];
                              return Align(
                                alignment: Alignment(0, -1),
                                child: StreamBuilder<MealsRecord>(
                                  stream: MealsRecord.getDocument(mealsItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final cardMealsRecord = snapshot.data;
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                      child: InkWell(
                                        onLongPress: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DeteilsMealsWidget(
                                                      mealsRecord:
                                                          cardMealsRecord),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment(0, 0.97),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      cardMealsRecord.imagePath,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment(0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 5, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            0,
                                                                            7,
                                                                            0),
                                                                child: Text(
                                                                  cardMealsRecord
                                                                      .calories
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          7,
                                                                          0,
                                                                          5,
                                                                          5),
                                                              child: Text(
                                                                cardMealsRecord
                                                                    .name,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment(
                                                                      0, 1),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            1,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    final usersRecordData =
                                                                        {
                                                                      'selected_meals':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        cardMealsRecord
                                                                            .reference
                                                                      ]),
                                                                    };

                                                                    await mainUsersRecord
                                                                        .reference
                                                                        .update(
                                                                            usersRecordData);
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete_outlined,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 20,
                                                                  ),
                                                                  iconSize: 20,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
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
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 0, 0),
                      child: Text(
                        'Your Trainings',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: ForFutureLearn2(mainUsersRecors: mainUsersRecord,)
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final training =
                          mainUsersRecord.selectedTrainings?.toList() ?? [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: training.length,
                        itemBuilder: (context, trainingIndex) {
                          final trainingItem = training[trainingIndex];
                          return StreamBuilder<TrainingsRecord>(
                            stream: TrainingsRecord.getDocument(trainingItem),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              final cardTrainingsRecord = snapshot.data;
                              return InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DeteilsTrainingsWidget(
                                              trainingsRecord:
                                                  cardTrainingsRecord),
                                    ),
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                cardTrainingsRecord.imagePath,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 7, 0),
                                                      child: Text(
                                                        cardTrainingsRecord
                                                            .calories
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            7, 0, 0, 7),
                                                    child: Text(
                                                      cardTrainingsRecord.name,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 3),
                                                    child: IconButton(
                                                      onPressed: () async {
                                                        final usersRecordData =
                                                            {
                                                          'selected_trainings':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            cardTrainingsRecord
                                                                .reference
                                                          ]),
                                                        };

                                                        await mainUsersRecord
                                                            .reference
                                                            .update(
                                                                usersRecordData);
                                                      },
                                                      icon: Icon(
                                                        Icons.delete_outlined,
                                                        color: Colors.black,
                                                        size: 20,
                                                      ),
                                                      iconSize: 20,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
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
      },
    );
  }
}


class ForFutureLearn extends StatelessWidget {
  var mainUsersRecors;

  ForFutureLearn({Key key, this.mainUsersRecors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: CalcAllEatCalories(mainUsersRecors),
        builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
          return Text(snapshot.data.toString(),
          style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF670974),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
          );
        },
      ),
    );
  }
}


class ForFutureLearn2 extends StatelessWidget {
  var mainUsersRecors;

  ForFutureLearn2({Key key, this.mainUsersRecors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: CalcAllTrainCalories(mainUsersRecors),
        builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
          return Text(snapshot.data.toString(),
          style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF670974),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
          );
        },
      ),
    );
  }
}