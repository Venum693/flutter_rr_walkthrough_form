
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController pageController = PageController();
  int currentIndex = 0;
  onchanged(int index) {
    setState(() {
      currentIndex =index;
    });
  }

  List onBoardingData = [
  {
  "image": 'assets/images/welcome.png',
  "title": 'Welcome',
  "description1": "Explore & Connect With Bikers Community",
    "description2": "Around The World.",
  "description3": ""
  },
    {

      "image": 'assets/images/plan_rides.png',
      "title": 'Plan Rides',
      "description1": "Plan Rides With Fellow Riders To Create",
      "description2":   "A Bike Ride.",
      "description3": ""
    },
    {
     "image": 'assets/images/get_sponsorship.png',
      "title": 'Get Sponsorships',
      "description1": "Connect Sponsors To Get Sponsorship ",
      "description2": "Ride Or Club.",
      "description3": ""
    },

    {
      "image": 'assets/images/share_experience.png',
      "title": 'Share experience',
      "description1": "Share Experiences By Showcasing Your ",
      "description2":  "Current Or Previous Rides In The Form ",
    "description3": "Of Images. "

    }
  ];

  @override
  Widget build(BuildContext context) {

    var screenwidth= MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height*0.01358;

    print("width - $screenwidth and height - $screenheight");

    return Scaffold(
      appBar: AppBar(flexibleSpace: Container(width: 5,),
        title: Text('REAL  ROADIES', style: GoogleFonts.poppins(
            letterSpacing: 5,
          fontSize: 16, fontWeight: FontWeight.w700,color: Color(0xffF2F2F2),
            wordSpacing: 10
        ),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onBoardingData.length,
            onPageChanged: onchanged,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                        height: 270,width: 270,
                        child: Image.asset(onBoardingData[index]['image'],)),
                  ),

                 // SizedBox(height: MediaQuery.of(context).size.height*0.1015,),

                  Text(onBoardingData[index]['title'],
                  style: GoogleFonts.poppins(fontSize: 20,
                    fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),),

                  SizedBox(height: MediaQuery.of(context).size.height*0.0288,),

                 Text(onBoardingData[index]['description1'],
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF).withOpacity(0.6),),),

                  Text(onBoardingData[index]['description2'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF).withOpacity(0.6),),),
                  Text(onBoardingData[index]['description3'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF).withOpacity(0.6),),),

                  SizedBox(height: 8,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(

                              growable: true,
                                onBoardingData.length, (index) => buildDot(index, context),

                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.yellow,
                          radius: 20,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios_sharp),
                            onPressed: () {
                                 if(currentIndex == onBoardingData.length - 1){
                                 Navigator.pushReplacement(context,
                                   MaterialPageRoute(builder: (context)=> Openpage()),);
                            }
                              pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
                            },
                            iconSize: 20,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01358,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=> Openpage()));
                        },
                        child: Text('Skip',
                          style: GoogleFonts.poppins(fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,fontSize: 12,color: Color.fromRGBO(255, 255, 255, 0.6)),)),
                  )
                ],

              );
            },
          )
        ],
      ),
    );
  }

 Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.yellow : Colors.grey,
      ),
    );
  }
}

class Openpage extends StatefulWidget {
  const Openpage({Key? key}) : super(key: key);

  @override
  State<Openpage> createState() => _OpenpageState();
}

class _OpenpageState extends State<Openpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            child: const Icon(Icons.arrow_back_outlined,),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          },
        ),
        title: const Text('Press BACK'),
      ),
    );
  }
}


