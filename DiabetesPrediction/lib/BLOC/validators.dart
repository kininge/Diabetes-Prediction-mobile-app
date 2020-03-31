import 'dart:async';
import 'package:DiabetesPrediction/BLOC/bloc.dart';

class Validators
{
  
  final validateEmail= StreamTransformer<String, String>.fromHandlers
  (
    handleData: (String email, EventSink<String> sink)
    {
      if(RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(email))
      {
        sink.add(email);
      }
      else if(email== '')
      {
        sink.addError('Email is mandatory');
      }
      else
      {
        sink.addError('Please give a vlide email address');
      }
    }
  );

  final validatePassword= StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password== '')
      {
        sink.addError('Email is mandatory');
      }
      else if(password.length< 8)
      {
        sink.addError('Password must be more than 8 charecters');
      }
      else
      {
        sink.add(password);
      }
    }
  );

  final validateRePassword= StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink)
    {
      String orignalPassword= bloc.getPassword();
      if(password== '')
      {
        sink.addError('Email is mandatory');
      }
      else if(password!= orignalPassword)
      {
        sink.addError('Confirm password should be match with password');
      }
      else
      {
        sink.add(password);
      }
    }
  );

  final validateName= StreamTransformer<String, String>.fromHandlers
  (
    handleData: (String name, EventSink<String> sink)
    {
      if((RegExp(r"^([a-zA-Z]{1,})$").hasMatch(name)) || (RegExp(r"^([a-zA-Z]{1,}\s[a-zA-Z]{1,})$").hasMatch(name)) || (RegExp(r"^([a-zA-Z]{1,}\s[a-zA-Z]{1,}\s[a-zA-Z]{1,})$").hasMatch(name)))
      {
        sink.add(name);
      }
      else if(name== '')
      {
        sink.addError('Name is mandatory');
      }
      else
      {
        sink.addError('It is not look like name of person');
      }
    }
  );

  final validateCountryCode= StreamTransformer<int, int>.fromHandlers
  (
    handleData: (int code, EventSink<int> sink)
    {
      if(code.toString().length< 4)
      {
        sink.add(code);
      }
      else if(code.toString()== '')
      {
        sink.add(91);
      }
      else
      {
        sink.addError('');
      }
    }
  );

  final validateMobile= StreamTransformer<int, int>.fromHandlers
  (
    handleData: (int mobile, EventSink<int> sink)
    {
      if(mobile.toString().length== 10)
      {
        sink.add(mobile);
      }
      else if(mobile.toString()== '')
      {
        sink.addError('Mobile number is mandatory');
      }
      else
      {
        sink.addError('Mobile is 10 digit number');
      }
    }
  );
}