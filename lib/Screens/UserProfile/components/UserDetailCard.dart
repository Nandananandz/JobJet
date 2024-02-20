import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Container(
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        height: 4.04.h,
        width: 8.69.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFFE8ECFF)
        ),
        child: InkWell(
          onTap: () { 
            Navigator.pop(context);
           },
          child: Icon(Icons.chevron_left_sharp,color: Color(0xFF121B54),),
        ),
      )),


      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.23.h),
            Text('Complete your profile'),
            SizedBox(height: 3.93.h),

            Text('User name'),
            SizedBox(height: 0.89.h),
            textfield(),
            SizedBox(height: 1.68.h,),


            Text('Job type'),
            SizedBox(height: 0.89.h),
            textbox(),
            SizedBox(height: 1.68.h,),

            Text('Total years of experience'),
            SizedBox(height: 0.89.h),
            textbox(),
            SizedBox(height: 1.68.h,),

            Text('Job category'),
            SizedBox(height: 0.89.h),
            textbox(),
            SizedBox(height: 1.68.h,),

            Text('Current job time'),
            SizedBox(height: 0.89.h),
            textbox(),
            SizedBox(height: 1.68.h,),

            Text('Resume link'),
            SizedBox(height: 0.89.h),
            textfield(),
            SizedBox(height: 6.17.h,),

            Container(
              alignment: Alignment.center,
              height: 5.50.h,
              width: 85.40.w,
              decoration: BoxDecoration(
                color: Color(0xFF1F41BA),
                borderRadius:BorderRadius.circular(30),
              ),
              child: Text('Submit your profile',
              style:TextStyle(color: Color(0xFFFFFFFF)),),
            )

            
          ],
        ),
      ),
    );
  }
}


 textfield() {
    return Container(
          height: 4.94.h,
          width: 84.78.w,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFCBCBCB)),
            borderRadius: BorderRadius.circular(15),
            ),
          child:TextField(
            decoration:InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15)
            ),
          ),
        ); 
  }


 textbox() {
    return Container(
          alignment: Alignment.centerRight,
          height: 4.94.h,
          width: 84.78.w,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFCBCBCB)),
            borderRadius: BorderRadius.circular(15),
            ),
          child: InkWell(
            onTap: (){},
            child: Icon(Icons.arrow_drop_down),
          ),
          );
  }