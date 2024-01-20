
import 'package:crt_app/widgets/myWdgTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



Widget myWdgTextField(
  {
    required BuildContext context,
    required String textHint,
    required String textTitle,
    required TextEditingController controller,
    bool hasFocus = false,
    TextInputType textInputType = TextInputType.name,
    double width =  130,
    FocusNode? foco,
    IconData? iconPrefix,
    String? textAlertInfo,
    VoidCallback? onEditingComplete,
    Function(String)? onChanged,
  }
){

  return Container(
    margin: const EdgeInsets.only(right: 20),
    //color: hasFocus ? Colors.red : Colors.black,
    width: width,
    child: Column(
      children: [
        InkWell(
          onTap: () {
            if(textAlertInfo != null){
              showDialog(
                context: context,
                builder: (context) {    
                  return AlertDialog(
                    title: myWdgTitle(textTitle),
                    content: Text(textAlertInfo),
                  );
                },
              );
            }
          },
          child: Row(
            children: [
              Expanded(child: 
                Text(textTitle,overflow: TextOverflow.ellipsis,)
              ),
              if(textAlertInfo != null)
              const Icon(
                Icons.info,
                size: 15,
              )
            ],
          )
        ),
        Container(
          width: width,
          padding:const EdgeInsets.fromLTRB(10,0,10,5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 10),
                color: Color.fromARGB(10, 0, 0, 0)
              )
            ]
          ),
          child:
          Row(
            children: [
              if(iconPrefix != null)Icon(iconPrefix,size: 20,),
              if(iconPrefix != null)const SizedBox(width: 5,),
              Expanded(child: 
                TextField(
                  onChanged: (value) {
                    if(onChanged != null ){
                      onChanged(value);
                    }
                  },
                  controller: controller,
                  focusNode: foco,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    hoverColor: Colors.red,
                    border: InputBorder.none,
                    hintText: textHint,
                    hintStyle:const TextStyle(color: Color.fromARGB(255, 194, 194, 194))
                  ),
                  onEditingComplete: () {
                    if(onEditingComplete != null){
                      onEditingComplete();
                    }
                  },
                ),
              )
            ]
          )
        )
      ]
    ),
  );
}