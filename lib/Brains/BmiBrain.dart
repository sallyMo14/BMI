import 'Person.dart';

import 'dart:math';
class BmiBrain{
    bool? _isMale=null;
    int _weight =60;
    int _age=25;
    double _height=150;


    double? _bmi;
    String? _result;
    String? _advice;
    String _range="18.5 - 25 kg/m2";
    getBMI(Person p){

        int mass=p.getMass();
        int height=p.getHeight();
        _bmi= mass/(pow(height/100.0, 2));
        return _bmi;

    }

    getResult(double bmi){
        if((bmi <= 25 )&& (bmi >= 18.50))
            _result ="Normal";
        else if( bmi> 25)
            _result="Up Normal";
        else
            _result ="Under Normal";
        return _result;

    }

    getAdvice(double bmi){
        if(bmi <= 25 && bmi >= 18.50)
            _advice ="    You look great,\n Keep up the good work";
        if(bmi> 25)
            _advice="        You are overweight \nYou should loos some weight";
        else
            _advice ="    You looklike too slim  \n you should gain some weight";
        return _advice;
    }
    getRange(){

        return _range;

    }
    getHeight()=> _height;
    getWeight()=> _weight;
    IsMale()=> _isMale;
    getAge()=> _age;

    void reset(){
        this._age=25;
        this._height=150;
    }


















}