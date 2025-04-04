import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_o/pages/home.dart';

class intro extends StatefulWidget {
  const intro({super.key});

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> 
{
  
  static var myNewFontWhit =  GoogleFonts.pressStart2p(textStyle:const TextStyle(color: Colors.white , letterSpacing: 3 , fontSize: 30));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container
      (

        width: double.infinity,
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: 
          [
            const SizedBox(height: 40,),
            Text("TIC TAC TOE" , style: myNewFontWhit),
            const SizedBox(height: 200,),
            Container
            (
              child: AvatarGlow
              (
                startDelay: const Duration(milliseconds: 1000),
              glowShape: BoxShape.circle,
              curve: Curves.fastOutSlowIn,
                // endRadius: 60.0,
                duration: const Duration(seconds: 2),
                glowColor: Colors.white24,
                repeat: true,
                // repeatPauseDuration: Duration(seconds: 1),
                animate: true,
                child: Container
                (
                  decoration: BoxDecoration
                  (
                    border: Border.all(style: BorderStyle.none),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar
                  (
                    radius: 80,
                    backgroundColor: Colors.grey[900],
                    child: Image.asset("images/tic.png" , height: 100 , width: 100,)
                  ),
                )
              ),
            ),
            const SizedBox(height: 250,),
            ElevatedButton
            (
              style: ElevatedButton.styleFrom
              (

                padding:const EdgeInsetsDirectional.symmetric(horizontal: 80 , vertical: 20),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder
                (
                  borderRadius: BorderRadius.circular(12)
                )
              ) ,
              onPressed: () 
              {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> Home()), (route) => false,);
              }, 
              child: Text("Get Started" , style:  GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.black , letterSpacing: 3 , fontSize: 18)),)
            )
          ],


        ),
      ),
    );
  }
}