import 'package:DiabetesPrediction/screens/dataCollection.dart';
import 'package:DiabetesPrediction/screens/logIn.dart';
import 'package:flutter/material.dart';

class Choice extends StatelessWidget
{
  Size screenSize;

  @override 
  Widget build(BuildContext context)
  {
    screenSize= MediaQuery.of(context).size;

    return SafeArea
    (
      child: Scaffold
      (
        //backgroundColor: Color.fromRGBO(209, 209, 209, 1.0),
        body: Column
        (
          children: <Widget>
          [
            logo(),
            transitionPage(context),
          ],
        ),
      ),
    );
  }

  Widget logo()
  {
    return Hero
    (
      tag: 'splashToChoice',
      child: Container
      (
        padding: EdgeInsets.only(top: screenSize.height* 0.15, bottom: screenSize.height* 0.15),
        color: Color.fromRGBO(43, 174, 102, 1.0),
        child: Center
        (
          child: Column
          (
            children: <Widget>
            [
              Image.asset
              (
                'assets/images/diabetesPrediction.png',
                height: 150.0,
                width: 150.0,
              ),
              Text
              (
                'Diabetes Prediction',
                style: TextStyle
                (
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget transitionPage(BuildContext context)
  {
    Widget optionOne= Hero
    (
      tag: 'toDataCollection', 
      child: GestureDetector
      (
        child: RichText
        (
          text: TextSpan
          (
            style: null,
            children: 
            [
              TextSpan
              (
                text: 'Continue as ',
                style: TextStyle
                (
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ) 
              ),
              TextSpan
              (
                text: 'Guest',
                style: TextStyle
                (
                  fontSize: 20.0,
                  color: Color.fromRGBO(43, 174, 102, 1.0),
                  fontWeight: FontWeight.bold,
                ) 
              ),
            ]
          ),
        ),
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DataCollectionPage()));
        },
      ),
    );
    
    Widget divider= Row
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

    Widget optionTwo= Hero
    (
      tag: 'toLogIn', 
      child: GestureDetector
      (
        child: RichText
        (
          text: TextSpan
          (
            style: null,
            children: 
            [
              TextSpan
              (
                text: 'Want to ',
                style: TextStyle
                (
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ) 
              ),
              TextSpan
              (
                text: 'Log In',
                style: TextStyle
                (
                  fontSize: 20.0,
                  color: Color.fromRGBO(43, 174, 102, 1.0),
                  fontWeight: FontWeight.bold,
                ) 
              ),
            ]
          ),
        ),
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInPage()));
        },
      ),
    );

    return Container
    (
      child: Center
      (
        child: Column
        (
          children: <Widget>
          [
            SizedBox(height: screenSize.height* 0.1),
            optionOne,
            divider,
            optionTwo,
          ],
        ),
      ),
    );
  }
}