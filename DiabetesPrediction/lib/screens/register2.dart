import 'package:DiabetesPrediction/BLOC/bloc.dart';
import 'package:DiabetesPrediction/screens/register.dart';
import 'package:flutter/material.dart';

class Register2Page extends StatefulWidget
{
  @override 
  _Register2PageState createState()=> _Register2PageState();
}

class _Register2PageState extends State<Register2Page>
{
  Size screenSize;
  bool passwordHidden= true;
  bool rePasswordHidden= true;
  

  @override 
  Widget build(BuildContext context)
  {
    screenSize= MediaQuery.of(context).size;

    return SafeArea
    (
      child: Hero
      (
        tag: "page2",
        child: Scaffold
        (
          body: SingleChildScrollView
          (
            child: Container
            (
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              margin: EdgeInsets.only(top: screenSize.height* 0.08),
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  title(),
                  SizedBox(height: screenSize.height* 0.08),
                  subtitle(),
                  emailAddress(),
                  SizedBox(height: 20.0),
                  password(),
                  SizedBox(height: 20.0),
                  rePassword(),
                  SizedBox(height: 48.0),
                  Row
                  (
                    children: <Widget>
                    [
                      backButton(context),
                      registerButton(context),
                    ],
                  ),
                  SizedBox(height: 30.0)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget title()
  {
    return Center
    (
      child: Text
      (
        'Register',
        style: TextStyle
        (
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget subtitle()
  {
    return Container
    (
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 15.0, bottom: 25.0),
      child: Text
      (
        'Log in data',
        style: TextStyle
        (
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
          color: Colors.black45,
        ),
      ),
    );
  }

  Widget emailAddress()
  {
    return StreamBuilder
    (
      stream: bloc.registerEmail,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot)
      {
        return Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            Container
            (
              padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
              child: Text
              (
                'Email address',
                style: TextStyle
                (
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField
            ( 
              onChanged: bloc.registerEmailChanged,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration
              (
                hintText: 'someone@somewhere.com',
                errorText: snapshot.error,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon
                (
                  Icons.person,
                  color: Colors.black,
                  size: 26.0,
                ),
                enabledBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.black45, width: 3.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.black, width: 3.5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                errorBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.red, width: 3.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedErrorBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.red, width: 3.5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  Widget password()
  {
    return StreamBuilder
    (
      stream: bloc.registerPassword,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot)
      {
        return Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            Container
            (
              padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
              child: Text
              (
                'Password',
                style: TextStyle
                (
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField
            (  
              onChanged: bloc.registerPasswordChanged,
              obscureText: passwordHidden,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration
              (
                errorText: snapshot.error,
                filled: true,
                fillColor: Colors.white,
                hintText: 'password...',
                prefixIcon: Icon
                (
                  Icons.enhanced_encryption,
                  color: Colors.black,
                  size: 26.0,
                ),
                suffixIcon: GestureDetector
                (
                  onTap: ()
                  {
                    setState(() 
                    {
                      passwordHidden= !passwordHidden;
                    });
                  },

                  child: passwordHidden? 
                  Icon
                  (
                    Icons.visibility,
                    color: Colors.black,
                    size: 26.0,
                  ):
                  Icon
                  (
                    Icons.visibility_off,
                    color: Colors.black,
                    size: 26.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.black45, width: 3.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.black, width: 3.5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                errorBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.red, width: 3.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedErrorBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.red, width: 3.5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  Widget rePassword()
  {
    return StreamBuilder
    (
      stream: bloc.registerRePassword,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot)
      {
        return Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            Container
            (
              padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
              child: Text
              (
                'Re Password',
                style: TextStyle
                (
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField
            (  
              onChanged: bloc.registerRePasswordChanged,
              obscureText: rePasswordHidden,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration
              (
                errorText: snapshot.error,
                filled: true,
                fillColor: Colors.white,
                hintText: 'password...',
                prefixIcon: Icon
                (
                  Icons.enhanced_encryption,
                  color: Colors.black,
                  size: 26.0,
                ),
                suffixIcon: GestureDetector
                (
                  onTap: ()
                  {
                    setState(() 
                    {
                      rePasswordHidden= !rePasswordHidden;
                    });
                  },

                  child: rePasswordHidden? 
                  Icon
                  (
                    Icons.visibility,
                    color: Colors.black,
                    size: 26.0,
                  ):
                  Icon
                  (
                    Icons.visibility_off,
                    color: Colors.black,
                    size: 26.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.black45, width: 3.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.black, width: 3.5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                errorBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.red, width: 3.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedErrorBorder: OutlineInputBorder
                (
                  borderSide: BorderSide(color: Colors.red, width: 3.5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  Widget backButton(BuildContext context)
  {
    return FlatButton
    (
      onPressed: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
      },
      shape: RoundedRectangleBorder
      (
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding: EdgeInsets.only(right: screenSize.width* 0.02, left: 0.02, top: 18.0, bottom: 18.0,),
      child: Text
      (
        'Back',
        style: TextStyle
        (
          color: Colors.black45,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget registerButton(BuildContext context)
  {
    return StreamBuilder
    (
      stream: bloc.submitRegister2,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot)
      {
        return AbsorbPointer
        (
          absorbing: snapshot.data== null? true: false,
          child: RaisedButton
          (
            onPressed: ()
            {
              bloc.registerPage1();
            },
            splashColor: Colors.white,
            padding: EdgeInsets.only(right: screenSize.width* 0.235, left: screenSize.width* 0.24, top: 18.0, bottom: 18.0,),
            color: snapshot.data== null? Color.fromRGBO(209, 209, 209, 1.0): Color.fromRGBO(43, 174, 102, 1.0),
            shape: RoundedRectangleBorder
            (
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Text
            (
              'Register',
              style: TextStyle
              (
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      });
  }
}