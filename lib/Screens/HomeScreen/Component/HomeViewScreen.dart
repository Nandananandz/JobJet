import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        
      color: Color.fromARGB(255, 22, 9, 97),
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 70,),
          Image.asset("assets/pic.png"),
          SizedBox(height: 30,),
          Text("Find Your Dream\n              Job",
          style: GoogleFonts.poppins(
                 fontSize: 32,
                 fontWeight: FontWeight.w700,
                 color: Color(0xFFFEFEFE),

                 
                 
                  
                 
      
          ),
          
                  
                 ),
                SizedBox(height: 20,),
                 Text("Swipe through thousands of job listings in \n   the UAE from top companies. Discover \nnew opportunities that match your skills \n                     and experience",
                 style: GoogleFonts.nunitoSans(
                 fontSize: 16,
                 fontWeight: FontWeight.w600,
                 color: Color(0xFF7B88B3),

                 
                 
                  
                 
      
          ),
                 )
          
        ],
        
      ),
      ),
    );
  }
}