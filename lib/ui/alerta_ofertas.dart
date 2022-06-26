import 'dart:io';

import 'package:comparebem/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';

class AlertaPage extends StatefulWidget {
  const AlertaPage({ Key? key }) : super(key: key);

  @override
  State<AlertaPage> createState() => _AlertaPageState();
}

class _AlertaPageState extends State<AlertaPage> {


 

  final BannerAd myBanner = BannerAd(
  adUnitId: Platform.isAndroid ? 'ca-app-pub-4975130382486636/2423942300':
   'ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);

void initState() {
    super.initState();
    myBanner.load();
}


  @override
  Widget build(BuildContext context) {

    final Stream<QuerySnapshot> _usersStream =
    FirebaseFirestore.instance.collection('alertas').snapshots();

    return Scaffold(
      backgroundColor:  Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [

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
                  Text('Alerta de \nOfertas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold
                    ) ,
                  ),
                  
              ],
            ), 
            ),

            Divider(color: Colors.transparent),
            Divider(color: Colors.transparent),

           StreamBuilder<QuerySnapshot<Object?>>(
              stream: _usersStream,
              builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot>snapshot) {
              if (snapshot.hasError) {
              return Image.asset('images/error.png',);
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
              }
              return FadeIn(
                duration: Duration(seconds: 2),
                curve: Curves.easeIn,
                child: Column(
                  children: <Widget>[

                    Text('Veja as ofertas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.bold
                    ) ,
                  ),

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
                        title: Text(data["texto"] ?? "",
                          style: GoogleFonts.montserrat(
                          color: Colors.orange[700], fontSize: 15.0, fontWeight: FontWeight.bold
                        ) ,
                      ),
                      subtitle: Text(data["local"] ?? "",
                          style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold
                        ) ,
                      ),
                      trailing: IconButton(onPressed: (){
                        Share.share(data['texto'], subject: data['local']);
                      }, 
                      icon: FaIcon(FontAwesomeIcons.share,
                        color: Colors.orangeAccent, size: 18.0,
                      )               
                      ), 
                    );
                    }).toList(),
                  ),
                  ],
                )
              );
            }
            ),

            Divider(color: Colors.transparent,),

            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.orange[700],
                borderRadius: BorderRadius.all(Radius.circular(40.0),),
              ),
              width: 200.0,
              child: TextButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: FaIcon(FontAwesomeIcons.arrowCircleRight, color: Colors.white), 
                label: Text('Veja os folhetos de ofertas',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold
                  ) ,
                ),  
              ),
            ),

            Divider(color: Colors.transparent,),
              
            Container(
              width: 468.0,
              height: 60.0,
              child: AdWidget(ad: myBanner),
            ) 


          ]
        ),
      ),
    );
  }
}