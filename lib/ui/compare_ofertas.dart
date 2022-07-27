import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CompareOfertas extends StatefulWidget {
  const CompareOfertas({ Key? key }) : super(key: key);

  @override
  State<CompareOfertas> createState() => _CompareOfertasState();
}

class _CompareOfertasState extends State<CompareOfertas> {

final BannerAd myBanner = BannerAd(
  adUnitId: Platform.isAndroid ? 'ca-app-pub-4975130382486636/1608719933':
   'ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);

void initState(){
  super.initState();
    myBanner.load();
}

final Stream<QuerySnapshot> _compareofertasStream =
    FirebaseFirestore.instance.collection('compareofertas').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        scrollDirection: Axis.vertical,
        child: Column(

          children: [
            Divider(color: Colors.transparent,),
            Divider(color: Colors.transparent,),
            Divider(color: Colors.transparent,),
            Divider(color: Colors.transparent,),

            FadeIn(
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 20.0)),
                  Text('Compare as ofertas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500
                    ) ,
                  ),
              ],
              ), 
              ),

          Divider(color: Colors.transparent,),
          Divider(color: Colors.transparent,),


          StreamBuilder<QuerySnapshot<Object?>>(
            stream: _compareofertasStream,
            builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot>snapshot) {
                if (snapshot.hasError) {
                  return const Text("Lista Vazia");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                return FadeIn(
                  duration: Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: Column(
                    children: <Widget>[

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(20.0),),
                        ),
                        width: 170.0,
                        height: 40.0,
                        child: Text('Veja as ofertas',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w500
                        ) ,
                      ),
                      ),

                      Divider(color: Colors.transparent,),
                      Divider(color: Colors.transparent,),

                      ListView(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),  
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: 
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                            return ListTile(
                              minVerticalPadding: 15.0,
                              title: Container(
                                alignment: Alignment.center,
                                width: 350.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                color: Colors.orange[700],
                                borderRadius: BorderRadius.all(Radius.circular(15.0),),
                                ),
                                child: Text(data["ofertas1"] ?? "",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500
                                ) ,
                              ),
                              ),
                              
                              subtitle: Container(
                                alignment: Alignment.center,
                                width: 350.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(Radius.circular(10.0),),
                                ),
                                child: Text(data["ofertas2"] ?? "",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.bold
                                ) ,
                              ), 
                              ) 
                              
                                              
                            );
                        }).toList(),   
                      ),
                      
                      
                      
                    ],
                  )
                );
              }
          ),

          ],
        )
      ),
    );
  }
}