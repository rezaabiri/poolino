
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:poolino/common/poolino_colors.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<VerifyCodePage> {
  OtpFieldController otpController = OtpFieldController();

  List<String> number = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "ارسال کد",
    "00",
  ];
  List<String> type = [
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "text",
    "icon",
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: SingleChildScrollView(
           clipBehavior: Clip.antiAliasWithSaveLayer,
           child: Padding(
             padding: const EdgeInsets.all(20),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SvgPicture.asset("assets/images/login_vector.svg"),
                 SizedBox(height: 24,),
                 const Center(
                   child: Text("کد تایید 4 رقمی ارسال شده به شماره 09013421490 وارد نمایید.",
                       style: TextStyle(fontFamily: "yekan_bold", fontSize: 16), textDirection: TextDirection.rtl, textAlign: TextAlign.center,
                   ),
                 ),
                 SizedBox(height: 24,),
                 Center(
                   child: OTPTextField(
                       controller: otpController,
                       length: 4,
                       width: MediaQuery.of(context).size.width,
                       textFieldAlignment: MainAxisAlignment.spaceEvenly,
                       fieldWidth: 70,
                       contentPadding: EdgeInsets.all(12),
                       fieldStyle: FieldStyle.box,
                       outlineBorderRadius: 15,
                       keyboardType: TextInputType.phone,
                       spaceBetween: 8,
                       style: TextStyle(fontSize: 28, fontFamily: "yekan_semibold"),
                       onChanged: (pin) {
                         print("Changed: " + pin);
                       },
                       onCompleted: (pin) {
                         print("Completed: " + pin);
                       }),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     TextButton(
                       onPressed: (){}, 
                       child: Text("ویرایش شماره", 
                         style: TextStyle(fontFamily: "yekan_bold", fontSize: 14, color: PoolinoColors.baseColor,),
                       ),
                     ),
                     
                     Text("ارسال مجدد کد تایید: 01:30", style: TextStyle(fontSize: 14, fontFamily: "yekan_bold"),)
                     
                   ],
                 )

                 /*Padding(
                   padding: const EdgeInsets.only(top: 24, right: 20, left: 20, bottom: 24),
                   child: GridView.builder(
                     shrinkWrap: true,
                       clipBehavior:Clip.antiAlias,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                       itemCount: number.length,
                       itemBuilder: (context, index){
                         return PoolinoKeyboard(value: number[index], type: type[index], onTap: (value){

                           otpController.setValue(value, index);
                           otpController.setFocus(index);
                           PoolinoSnackBar(icon : Icons.add, type: Constants.SUCCESS).showPoolinoSnackBar(context, value);
                         });
                       }),
                 )*/

               ],
             ),
           ),
         )
      ),
    );
  }
}
