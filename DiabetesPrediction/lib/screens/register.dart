import 'package:DiabetesPrediction/BLOC/bloc.dart';
import 'package:DiabetesPrediction/screens/logIn.dart';
import 'package:DiabetesPrediction/screens/register2.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget
{
  @override 
  _RegisterPageState createState()=> _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  Size screenSize;
  List<bool> isSelected= [false, false, false];

  @override 
  Widget build(BuildContext context)
  {
    screenSize= MediaQuery.of(context).size;

    return SafeArea
    (
      child: Hero
      (
        tag: "toRegister",
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
                  name(),
                  SizedBox(height: 20.0),
                  Row
                  (
                    children: <Widget>
                    [
                      countryCode(),
                      SizedBox(width: 20.0,),
                      mobile(),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  gender(),
                  SizedBox(height: 48.0),
                  Row
                  (
                    children: <Widget>
                    [
                      cancelButton(context),
                      nextButton(context),
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
        'Personal data',
        style: TextStyle
        (
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
          color: Colors.black45,
        ),
      ),
    );
  }

  Widget name()
  {
    return StreamBuilder
    (
      stream: bloc.name,
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
                'Name',
                style: TextStyle
                (
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField
            (
              
              onChanged: bloc.nameChanged,
              keyboardType: TextInputType.text,
              decoration: InputDecoration
              (
                hintText: 'Your_Name father_Name Surname',
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

  Widget countryCode()
  {
    return StreamBuilder
    (
      initialData: 91,
      stream: bloc.countryCode,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot)
      {
        return Expanded
        (
          flex: 3,
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>
            [
              Container
              (
                padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                child: Text
                (
                  'Code',
                  style: TextStyle
                  (
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField
              (
                onChanged: (strNum) => bloc.setsCountryCode((int.parse(strNum))),
                keyboardType: TextInputType.number,
                decoration: InputDecoration
                (
                  hintText: '091',
                  errorText: snapshot.error,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon
                  (
                    Icons.account_balance_wallet,
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
          ),
        );
      }
    );
  }

  Widget mobile()
  {
    return StreamBuilder
    (
      stream: bloc.mobile,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot)
      {
        return Expanded
        (
          flex: 5,
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>
            [
              Container
              (
                padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                child: Text
                (
                  'Mobile number',
                  style: TextStyle
                  (
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField
              (
                onChanged: (strNum) => bloc.setsMobile((int.parse(strNum))),
                keyboardType: TextInputType.number,
                decoration: InputDecoration
                (
                  hintText: '98*****6*8',
                  errorText: snapshot.error,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon
                  (
                    Icons.phone_iphone,
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
          ),
        );
      }
    );
  }

  Widget gender()
  {
    return StreamBuilder
    (
      stream: bloc.name,
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
                'Gender',
                style: TextStyle
                (
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ToggleButtons
            (
              borderColor: Colors.black45,
              color: Colors.black45,
              fillColor: Colors.white,
              borderWidth: 3.5,
              selectedBorderColor: Colors.black,
              selectedColor: Colors.black,
              borderRadius: BorderRadius.circular(15.0),
              children: <Widget>
              [
                Container
                (
                  width: screenSize.width* 0.282,
                  padding: EdgeInsets.all(10),
                  child: Column
                  (
                    children: <Widget>
                    [
                      Image.asset
                      (
                        'assets/images/male.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                      Text
                      (
                        'Male',
                      ),
                    ],
                  ),
                ),

                Container
                (
                  width: screenSize.width* 0.282,
                  padding: EdgeInsets.all(10),
                  child: Column
                  (
                    children: <Widget>
                    [
                      Image.asset
                      (
                        'assets/images/female.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                      Text
                      (
                        'Female',
                      ),
                    ],
                  ),
                ),
                
                Container
                (
                  width: screenSize.width* 0.285,
                  padding: EdgeInsets.all(10),
                  child: Column
                  (
                    children: <Widget>
                    [
                      Image.asset
                      (
                        'assets/images/transgender.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                      Text
                      (
                        'Transgender',
                      ),
                    ],
                  ),
                ),
              ],
              
              onPressed: (int index) 
              {
                setState(() 
                {
                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) 
                  {
                    if (buttonIndex == index) 
                    {
                      isSelected[buttonIndex] = !isSelected[buttonIndex];
                      bloc.setsGender(index);
                    } 
                    else 
                    {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
            ),
          ],
        );
      },
    );
  }

  Widget cancelButton(BuildContext context)
  {
    return FlatButton
    (
      onPressed: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInPage()));
      },
      shape: RoundedRectangleBorder
      (
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding: EdgeInsets.only(right: screenSize.width* 0.02, left: 0.02, top: 18.0, bottom: 18.0,),
      child: Text
      (
        'Cancel',
        style: TextStyle
        (
          color: Colors.black45,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget nextButton(BuildContext context)
  {
    return StreamBuilder
    (
      stream: bloc.submitRegister1,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot)
      {
        return AbsorbPointer
        (
          absorbing: snapshot.data== null? true: false,
          child: RaisedButton
          (
            onPressed: ()
            {
              bloc.registerPage();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Register2Page()));
            },
            splashColor: Colors.white,
            padding: EdgeInsets.only(right: screenSize.width* 0.26, left: screenSize.width* 0.26, top: 18.0, bottom: 18.0,),
            color: snapshot.data== null? Color.fromRGBO(209, 209, 209, 1.0): Color.fromRGBO(43, 174, 102, 1.0),
            shape: RoundedRectangleBorder
            (
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Text
            (
              'Next',
              style: TextStyle
              (
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
    );
  }

}