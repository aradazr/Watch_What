import 'package:flutter/material.dart';
import 'package:random_series/constans/responsive_text.dart';
import 'package:random_series/data/project_data.dart';
import 'package:random_series/widgets/bttn_widget.dart';

class SerialScreen extends StatefulWidget {
  const SerialScreen({super.key});

  @override
  State<SerialScreen> createState() => _SerialScreenState();
}

class _SerialScreenState extends State<SerialScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: size.height / 1.63,
                width: size.width,
                child: Image.network(
                  projects[0].imagePath
                ,fit: BoxFit.cover,
                ),
              )
            //   Image.asset(
            //   'assets/images/silo2.png',width: 400, 
            //   fit: BoxFit.cover,
            // ),
            ,Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 20,
                    blurRadius: 40,
                    offset: Offset(0, 3),
                  )
                ]
              ),
            ),
            Positioned(
              bottom: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    projects[0].point
                  ,style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'mont',
                    fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 14)
                  ),),
                  Image.asset('assets/images/star.png',height: 24,)
                ],
              ),
            )
            ]
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Text(
                    projects[0].name,
                    style: TextStyle(
                        fontFamily: 'mont',
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 24),
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height / 32.37,
                  ),
                  SizedBox(
                    height: size.height / 6.33,
                    width: size.width / 1.18,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        projects[0].description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'vazirm',
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 13),
                          color: Color(0xff999999),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 57,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BttnWidget(
                        size: size,
                        color: Color(0xff262626),
                        text: 'همینو میبینم',
                      ),
                      BttnWidget(
                        size: size,
                        color: Color(0xffB61111),
                        text: '!دوباره سرچ کن',
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
