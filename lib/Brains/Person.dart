class Person{
  int? height=0;
  int? mass=0;
  bool? isMale;
  int? age=0;

  Person({required this.age,required this.height,required this.isMale,required this.mass});

  int getHeight(){
    return this.height!;
  }
  int getMass(){
    return this.mass!;
  }
  bool ismale(){
    return this.isMale!;
  }


}