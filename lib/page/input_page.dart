
import 'package:community/page/profile_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  final String title;
  final String hintText;
  final int index;
  const InputPage({super.key,this.title="编辑昵称",this.hintText="",this.index=0});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String saveText = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.title,style: const TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon:const Icon(Icons.keyboard_arrow_left_sharp,size: 38,color: Colors.black,)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: TextButton(onPressed: (){
              // if(widget.index==1){Body(netName: saveText,);}
              // else if(widget.index==2){Body(name: saveText,);}
              // else if(widget.index==3){Body(age: saveText,);}
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (BuildContext context){
              //     return const ProfileScreen();
              //   })
              // );
              
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context){
                  if(widget.index==1){
                    return ProfileScreen(netName: saveText,);
                  }
                  else if(widget.index==2){
                    return ProfileScreen(name: saveText,);
                  }
                  
                  return ProfileScreen(age: saveText,);
                  
                })
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              )
            ), 
            child: const Text("完成",style: (TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),),
            ),
          ),
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
              ),
            filled: true,
            fillColor: const Color(0xffF6F6F8),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(12)
            ],
            maxLength: 12,
            onChanged: (value) {
              saveText=value;
            },
          ),
        ),
      );
  }
}



