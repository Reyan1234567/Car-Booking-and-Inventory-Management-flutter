import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Domain/entities/Signup.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';

import '../providers/signup/signup_state.dart';
import '../widgets/SnackBar.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  String firstNameErr='';
  String lastNameErr='';
  String emailErr='';
  String phoneErr='';
  String birthErr='';

  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final phoneNumberController=TextEditingController();
  final emailController=TextEditingController();
  final dateController=TextEditingController();

  Future<void> _selectDate() async{
    DateTime? picked=await showDatePicker(context: context, initialDate:DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2050));
    if(picked!=null){
      setState(() {
        dateController.text=picked.toString().split(" ")[0];
      });
    }
  }

  void _handleSignup(){
    final firstName=firstNameController.text;
    final lastName=lastNameController.text;
    final phoneNumber=phoneNumberController.text;
    final email=emailController.text;
    final birth=dateController.text;
    if(validateEmail(email)==''&& validateFirstName(firstName)=='' && validateLastName(lastName)=='' && validatePhone(phoneNumber)=='' && validateBirthDate(birth)==''){
      final userSignup1=SignupPart1(email, phoneNumber, birth, lastName, firstName);
    context.push("/signup1", extra: userSignup1);
    }
    if(validateEmail(email)!=''){
      setState(() {
        emailErr=validateEmail(email);
      });
    }
    else{
      setState(() {
        emailErr='';
      });
    }
    if(validateFirstName(firstName)!=''){
      setState(() {
        firstNameErr=validateFirstName(firstName);
      });
    }
    else{
      firstNameErr='';
    }
    if(validateLastName(lastName)!=''){
      setState(() {
        lastNameErr=validateLastName(lastName);
      });
    }
    else{
      setState(() {
        lastNameErr='';
      });
    }
    if(validatePhone(phoneNumber)!=''){
      setState(() {
        phoneErr=validatePhone(phoneNumber);
      });
    }
    else{
      setState(() {
        phoneErr='';
      });
    }
    if(validateBirthDate(birth)!=''){
      setState(() {
        birthErr=validateBirthDate(birth);
      });
    }
    else{
      birthErr='';
    }
  }

  String validateFirstName(String firstname){
    if(firstname.isEmpty){
      return "Firstname is required";
    }
    else if(firstname.length<3){
      return "Firstname should be 3 characters at least";
    }
    else if(firstname.length>20){
      return "Firstname should be 20 characters at most";
    }
    else{
      return '';
    }
  }

  String validateLastName(String lastname){
    if(lastname.isEmpty){
      return "Lastname is required";
    }
    else if(lastname.length<3){
      return "Lastname should be 3 characters at least";
    }
    else if(lastname.length>20){
      return "Lastname should be 20 characters at most";
    }
    else{
      return '';
    }
  }

  String validateBirthDate(String birthDate){
    DateTime? bDate=DateTime.tryParse(birthDate);
    DateTime minDate=DateTime(1940);
    DateTime maxDate=DateTime(2010);
    if(bDate==null){
      return "BirthDate is required";
    }
    else if(bDate.isBefore(minDate)){
      return "You are too old for this shit";
    }
    else if(bDate.isAfter(maxDate)){
      return "You are too young for this shit";
    }
    else{
      return '';
    }
  }

  String validateEmail(String email){
    final emailRegex = RegExp(r'^.+@.+\..+$');
    if(email.isEmpty){
      return "Email is required";
    }
    else if(!emailRegex.hasMatch(email)){
      return "enter a valid Email";
    }
    else{
      return '';
    }
  }

  String validatePhone(String phoneNumber){
    if(phoneNumber.isEmpty){
      return "Phonenumber is required";
    }
    else if(phoneNumber.length!=10){
      return "enter a valid PhoneNumber";
    }
    else if(phoneNumber[0]!='0' && (phoneNumber[1]!='9'||phoneNumber[1]!='7')){
      return "Phonenumber must start with 09 or 07";
    }
    else{
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(25),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Image.asset(
                'assets/images/polo.png',
                width: 70,
                height:80,
                fit:BoxFit.contain
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SignUp", style: TextStyle(fontFamily: 'InterBold', fontSize:20),),
                ],
              ),
              SizedBox(height: 20,),
              customTextField(firstNameController, TextInputType.text, "Firstname", false, "John"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(firstNameErr, style: TextStyle(color: Colors.red, fontSize: 10),),
                ],
              ),
              SizedBox(height: 10),
              customTextField(lastNameController, TextInputType.text, "Lastname", false,"Doe"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Text(lastNameErr, style: TextStyle(color: Colors.red, fontSize: 10)),
              ],
            ),
              SizedBox(height: 10),
              customTextField(phoneNumberController, TextInputType.text, "Phone-Number", false, "09 or 0712345678"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(phoneErr, style: TextStyle(color: Colors.red, fontSize: 10),),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                readOnly:true,
                controller:dateController,
                decoration:InputDecoration(
                  labelText: "Pick a Date",
                  suffixIcon: IconButton(onPressed: _selectDate, icon: Icon(Icons.calendar_month)),
                  labelStyle: TextStyle(fontFamily: "InterBold", color: Color(0xFF9D9D9D)),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color:Color(0xFFC3C3C3),
                      width:1
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Color(0xFFC3C3C3),
                        width: 1.0
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.orange.shade600,
                      width: 2.0
                    )
                  )

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(birthErr, style: TextStyle(color: Colors.red, fontSize: 10),),
                ],
              ),
              SizedBox(height: 10),
              customTextField(emailController, TextInputType.text, "Email", false, "johnDoe@gmail.com"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(emailErr, style: TextStyle(color: Colors.red, fontSize: 10),),
                ],
              ),
              SizedBox(height: 10),
              customTextButton(_handleSignup, "Next"),
              Spacer()
            ],
          )
        )
      )
    );
  }
}
