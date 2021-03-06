import 'package:DiabetesPrediction/BLOC/bloc.dart';
import 'package:DiabetesPrediction/screens/register.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget
{
  @override 
  _LogInPageState createState()=> _LogInPageState();
}

class _LogInPageState extends State<LogInPage>
{
  Size screenSize;
  BLOC bloc= new BLOC();
  bool passwordHidden= true;

  @override 
  Widget build(BuildContext context)
  {
    screenSize= MediaQuery.of(context).size;

    return  SafeArea
    (
      child: Hero
      (
        tag: 'toLogIn', 
        child: Scaffold
        (
          body: SingleChildScrollView
          (
            child: Container
            (
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              margin: EdgeInsets.only(top: screenSize.height* 0.15),
              child: Column
              (
                children: <Widget>
                [
                  title(),
                  SizedBox(height: screenSize.height* 0.08),
                  emailAddress(),
                  SizedBox(height: 20.0),
                  password(),
                  SizedBox(height: 20.0),
                  Row
                  (
                    children: <Widget>
                    [
                      registerButton(context),
                      logInButton(context),
                    ],
                  ),
                  divider(),
                  Row
                  (
                    children: <Widget>
                    [
                      google(context),
                      SizedBox(width: 20.0),
                      facebook(context),
                    ],
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            )
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
        'Log In',
        style: TextStyle
        (
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget emailAddress()
  {
    return StreamBuilder
    (
      stream: bloc.email,
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
              onChanged: bloc.emailChanged,
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
      stream: bloc.password,
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
              onChanged: bloc.passwordChanged,
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

  Widget registerButton(BuildContext context)
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
        'Register',
        style: TextStyle
        (
          color: Colors.black45,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget logInButton(BuildContext context)
  {
    return StreamBuilder
    (
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot)
      {
        return AbsorbPointer
        (
          absorbing: snapshot.data== null? true: false,
          child: RaisedButton
          (
            onPressed: ()
            {
              bloc.submit();
            },
            splashColor: Colors.white,
            padding: EdgeInsets.only(right: screenSize.width* 0.255, left: screenSize.width* 0.26, top: 18.0, bottom: 18.0,),
            color: snapshot.data== null? Color.fromRGBO(209, 209, 209, 1.0): Color.fromRGBO(43, 174, 102, 1.0),
            shape: RoundedRectangleBorder
            (
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Text
            (
              'Log In',
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

  Widget divider()
  {
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>
      [
        Container
        (
          color: Colors.black,
          height: 1.0,
          width: screenSize.width* 0.4,
        ),
        Container
        (
          padding: EdgeInsets.only(right: 5.0, left: 5.0, top: 30.0, bottom: 30.0),
          child: Text
          (
            'OR',
            style: TextStyle
            (
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container
        (
          color: Colors.black,
          height: 1.0,
          width: screenSize.width* 0.4,
        ),
      ],
    );
  }

  Widget google(BuildContext context)
  {
    return Expanded
    (
      child: RaisedButton
      (
        onPressed: ()
        {

        },
        splashColor: Color.fromRGBO(43, 174, 102, 1.0),
        padding: EdgeInsets.only(top: screenSize.width* 0.1, bottom: screenSize.width* 0.1),
        color: Color.fromRGBO(209, 209, 209, 1.0),
        shape: RoundedRectangleBorder
        (
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Image.asset
        (
          'assets/images/google.png',
          height: 30.0,
          width: 30.0,
        ),
      ),
    );
  }

  Widget facebook(BuildContext context)
  {
    return Expanded(
      child: RaisedButton
      (
        onPressed: ()
        {

        },
        splashColor: Color.fromRGBO(43, 174, 102, 1.0),
        padding: EdgeInsets.only(top: screenSize.width* 0.1, bottom: screenSize.width* 0.1),
        color: Color.fromRGBO(209, 209, 209, 1.0),
        shape: RoundedRectangleBorder
        (
          //side: BorderSide(color: Colors.black, width: 3.0),
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Image.asset
        (
          'assets/images/facebook.png',
          height: 30.0,
          width: 30.0,
        ),
      ),
    );
  }
}