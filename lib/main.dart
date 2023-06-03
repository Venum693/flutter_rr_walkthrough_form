
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



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
  bool isLastPage = false;


  @override

  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var screenwidth= MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height*0.0287;

    print("width - $screenwidth and height - $screenheight");

    return Scaffold(
      appBar: AppBar(
        title: Text('REAL  ROADIES', style: GoogleFonts.poppins(
            letterSpacing: 5,
          fontSize: 16, fontWeight: FontWeight.w700,color: Color(0xffF2F2F2),
            wordSpacing: 10
        ),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          padding: EdgeInsets.only(bottom: 110),
          child: PageView(
            controller: pageController,
            onPageChanged: (index){
              setState(() => isLastPage = index==3);
            },
            children: [
              buildpage(image: 'assets/images/welcome2.png',
                  title: 'Welcome',
                  subtitle: 'Explore & Connect With Bikers Community Around The World.'),
              buildpage(
                  image: 'assets/images/planrides2.png',
                  title: 'Plan Rides',
                  subtitle: "Plan Rides With Fellow Riders To Create A Bike Ride."),
              buildpage(
                  image: 'assets/images/get_sponsorship2.png',
                  title: 'Get Sponsorships',
                  subtitle: "Connect Sponsors To Get Sponsorship Ride Or Club."),
              buildpage(
                  image: 'assets/images/share_experience2.png',
                  title: 'Share experience',
                  subtitle: "Share Experiences By Showcasing Your Current Or Previous Rides In The Form Of Images.")


            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height*0.1859,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 4,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.yellow,
                  spacing: 10,
                  dotHeight: 15,
                  dotWidth: 15
                ),
                  onDotClicked: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn),
                ),

                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios_sharp),
                    onPressed: () {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceIn);

                      if(isLastPage == true)
                        {
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=> Openpage()),);
                        }
                    },
                    iconSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=> Openpage()));
                  },
                  child: Text('Skip',textScaleFactor: 1,
                    style: GoogleFonts.poppins(fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xffFFFFFF).withOpacity(0.6)),)),
            )
          ],
        ),
      ),

    );
  }

 Widget buildpage({
    required String image,
   required String title,
   required String subtitle
 }) => Container(
   child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       SizedBox(height: MediaQuery.of(context).size.height*0.0675,),
       Image.asset(image,fit: BoxFit.cover,),
       SizedBox(height: MediaQuery.of(context).size.height*0.101859,),
       Text(title,style: GoogleFonts.poppins(fontSize: 20,
           fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),textScaleFactor: 1),
       //SizedBox(height: MediaQuery.of(context).size.height*0.0287,),
       SizedBox(height: MediaQuery.of(context).size.height*0.0287,),
       Container(
         padding: EdgeInsets.symmetric(horizontal: 17),
         child: Text(textScaleFactor: 1,subtitle, textAlign: TextAlign.center,style: GoogleFonts.poppins(fontSize: 16,
           fontWeight: FontWeight.w400,
           color: Color(0xffFFFFFF).withOpacity(0.6),)),
       )


     ],
   ),
 );
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


