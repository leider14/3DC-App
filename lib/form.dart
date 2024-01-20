

import 'package:crt_app/widgets/myWdgButtonOne.dart';
import 'package:crt_app/widgets/myWdgContainer.dart';
import 'package:crt_app/widgets/myWdgTextField.dart';
import 'package:crt_app/widgets/myWdgTitleNumber.dart';
import 'package:crt_app/widgets/myWdgTitlePrice.dart';
import 'package:crt_app/widgets/myWdgTitleSuper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyFormNewImpression extends StatefulWidget {
  const MyFormNewImpression({super.key});

  @override
  State<MyFormNewImpression> createState() => _MyFormNewImpressionState();
}

class _MyFormNewImpressionState extends State<MyFormNewImpression> {

  TextEditingController controllerPrecio = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerLuz = TextEditingController();
  TextEditingController controllerGastoMaquina = TextEditingController();
  TextEditingController controllerTiempo = TextEditingController();
  TextEditingController controllerGramos = TextEditingController();
  TextEditingController controllerGanancia = TextEditingController();

  ScrollController scrollController = ScrollController();

  FocusNode focoPrecio = FocusNode();
  FocusNode focoPeso = FocusNode();
  FocusNode focoLuz = FocusNode();
  FocusNode focoGastoMaquina = FocusNode();
  FocusNode focoTiempo = FocusNode();
  FocusNode focoGramos = FocusNode();
  FocusNode focoGanancia = FocusNode();

  double totalLuz = 0;
  double totalGastoMaquina = 0;
  double totalTiempo = 0;
  double totalPeso = 0;
  double totalPorcentajeGanancia = 0;
  double totalSubTotal = 0;
  double totalCompleto = 0;

  bool showFloatResult = false;

  void operaciones(){
    if (controllerGastoMaquina.text.isNum){
      totalGastoMaquina =  double.parse(controllerGastoMaquina.text) * 1100000;
    }
    if (controllerLuz.text.isNum){
      totalLuz =  double.parse(controllerLuz.text);
    }
    if (controllerTiempo.text.isNum){
      totalTiempo =  double.parse(controllerTiempo.text) * 51;
    }
    if (controllerGanancia.text.isNum){
      totalPorcentajeGanancia =  double.parse(controllerGanancia.text);
    }
    if (
      controllerPeso.text.isNum &&
      controllerPrecio.text.isNum &&
      controllerGramos.text.isNum ){
      totalPeso =  double.parse(controllerPrecio.text) / double.parse(controllerPeso.text) * double.parse(controllerGramos.text);
    }
    totalSubTotal = (totalGastoMaquina + totalLuz + totalPeso + totalTiempo);
    totalPorcentajeGanancia = (totalSubTotal * totalPorcentajeGanancia);
    totalCompleto = totalPorcentajeGanancia + totalSubTotal;
    setState(() {});
  }

  void limpiarDatos(){
    setState(() {
      controllerGanancia.clear();
      controllerGastoMaquina.clear();
      controllerGramos.clear();
      controllerLuz.clear();
      controllerPeso.clear();
      controllerPrecio.clear();
      controllerTiempo.clear();
      totalCompleto = 0;
      totalGastoMaquina = 0;
      totalLuz = 0;
      totalPeso = 0;
      totalPorcentajeGanancia = 0;
      totalTiempo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 149, 59, 53),
        title: myWdgTitleSuper("3DC Prints"),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                showFloatResult = !showFloatResult;
              });
            },
            icon: const Icon(Icons.all_out_rounded,color: Colors.white,)
          ),
          IconButton(
            onPressed: (){
              limpiarDatos();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Limpio"),
                  showCloseIcon: true,
                )
              );
            },
            icon: const Icon(Icons.delete_outline_rounded,color: Colors.white,)
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_vert_outlined,color: Colors.white,)
          )
        ],
      ),
      backgroundColor:const Color.fromARGB(255, 249, 250, 252),
      body: Stack(children: [
        
      ListView(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
        children: [
          myWdgContainer(
            title: "Filamento",
            child: Wrap(
              children: [
                myWdgTextField(
                  context: context,
                  controller: controllerPrecio,
                  textInputType: TextInputType.number,
                  textHint: "\$5000",
                  textTitle: "Precio",
                  iconPrefix: Icons.attach_money_rounded,
                  foco: focoPrecio,
                  onChanged: (p0) => operaciones(),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focoPeso);
                  },
                ),
                myWdgTextField(
                  context: context,
                  controller: controllerPeso,
                  textHint: "15g",
                  textInputType: TextInputType.number,
                  textTitle: "Peso",
                  iconPrefix: Icons.balance_outlined,
                  foco: focoPeso,
                  onChanged: (p0) => operaciones(),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focoLuz);
                  },
                ),
              ],
            )
          ),
          const SizedBox(height: 10,),
          myWdgContainer(
            title: "Hora Impresión",
            child: Wrap(
              children: [
                myWdgTextField(
                  context: context,
                  textHint: "\$5000",
                  controller: controllerLuz,
                  textInputType: TextInputType.number,
                  textTitle: "Luz",
                  iconPrefix: Icons.attach_money_rounded,
                  foco: focoLuz,
                  onChanged: (p0) => operaciones(),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focoGastoMaquina);
                  },
                ),
                myWdgTextField(
                  context: context,
                  textHint: "0.1%",
                  controller: controllerGastoMaquina,
                  textInputType: TextInputType.number,
                  textTitle: "Gasto de maquina",
                  iconPrefix: Icons.percent,
                  foco: focoGastoMaquina,
                  onChanged: (p0) => operaciones(),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focoTiempo);
                  },
                ),
              ],
            )
          ),
          const SizedBox(height: 10,),
          myWdgContainer(
            title: "Precio Impresión",
            child: Wrap(
              children: [
                myWdgTextField(
                  context: context,
                  textHint: "12min",
                  controller: controllerTiempo,
                  textInputType: TextInputType.number,
                  textTitle: "Tiempo",
                  iconPrefix: Icons.timer_outlined,
                  foco: focoTiempo,
                  onChanged: (p0) => operaciones(),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focoGramos);
                  },
                ),
                myWdgTextField(
                  context: context,
                  textHint: "16gm",
                  controller: controllerGramos,
                  textInputType: TextInputType.number,
                  textTitle: "Gramos",
                  textAlertInfo: "Gramos = (Precio/Peso) * x",
                  iconPrefix: Icons.balance_rounded,
                  foco: focoGramos,
                  onChanged: (p0) => operaciones(),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(focoGanancia);
                  },
                ),
              ],
            )
          ),
          const SizedBox(height: 10,),
          myWdgContainer(
            title: "Ganancia",
            child: Wrap(
              children: [
                myWdgTextField(
                  context: context,
                  textHint: "1.0%",
                  controller: controllerGanancia,
                  width: 300,
                  textInputType: TextInputType.number,
                  textTitle: "Porcentaje",
                  iconPrefix: Icons.percent_outlined,
                  foco: focoGanancia,
                  onChanged: (p0) => operaciones(),
                  onEditingComplete: () {
                    final FocusScopeNode focus = FocusScope.of(context);
                    if (!focus.hasPrimaryFocus && focus.hasFocus) {
                        FocusManager.instance.primaryFocus!.unfocus();
                    }
                    scrollController.animateTo(
                      200,
                      duration: Duration(seconds: 1),
                      curve: Curves.decelerate
                    );
                  },
                ),
              ],
            )
          ),
          SizedBox(height: !showFloatResult ? 180 : 10,),
          if(showFloatResult)
          myWdgContainer(
            title: "Resultado",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myWdgTitlePrice(
                title: "Total Luz: ",
                price: totalLuz
              ),
              myWdgTitlePrice(
                title: "Total Gasto Maquina: ",
                price: totalGastoMaquina
              ),
              myWdgTitlePrice(
                title: "Total Tiempo: ",
                price: totalTiempo
              ),
              myWdgTitlePrice(
                title: "Total Peso: ",
                price: totalPeso
              ),
              myWdgTitlePrice(
                title: "Total Porcentaje: ",
                price: totalPorcentajeGanancia
              ),
              myWdgTitlePrice(
                title: "Total Subtotal:",
                price: totalSubTotal
              ),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width -80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 149, 59, 53),
                  ),
                  child:Center(
                    child:Text(
                      "Total: ${NumberFormat.simpleCurrency(
                        decimalDigits: 2,
                      ).format(totalCompleto)}",
                      style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white
                      ),
                    )
                  ),
                )
                
              ],
            )
          ),
        ],
      ),
      if(!showFloatResult)Positioned(
        bottom: 0,child: 
        myWdgContainer(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          title: "Resultado",
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myWdgTitlePrice(
                title: "Total Luz: ",
                price: totalLuz
              ),
              myWdgTitlePrice(
                title: "Total Gasto Maquina: ",
                price: totalGastoMaquina
              ),
              myWdgTitlePrice(
                title: "Total Tiempo: ",
                price: totalTiempo
              ),
              myWdgTitlePrice(
                title: "Total Peso: ",
                price: totalPeso
              ),
              myWdgTitlePrice(
                title: "Total Porcentaje: ",
                price: totalPorcentajeGanancia
              ),
              myWdgTitlePrice(
                title: "Total Subtotal:",
                price: totalSubTotal
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width -80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 149, 59, 53),
                ),
                child:Center(
                  child:Text(
                    "Total: ${NumberFormat.simpleCurrency(
                      decimalDigits: 2,
                    ).format(totalCompleto)}",
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white
                    ),
                  )
                ),
              )
            ],
          )
        ),
      )]
      
      )
    );
  }
}