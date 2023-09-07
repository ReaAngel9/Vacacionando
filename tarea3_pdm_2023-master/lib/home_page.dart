import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Reserva tu hotel'),
      // ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(image: AssetImage('assets/xcaret_arte.png'), fit: BoxFit.fill,)
                  ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad();
                        },
                      ),
                    ),
                    Booking(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _Booking();
}

class _Booking extends State<Booking>{
  bool isBookingPressed = false;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: () {
            if(isBookingPressed == false){
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Reservación en proceso'),
                ),
              );
            }
      
            setState(() {
              isBookingPressed = !isBookingPressed;
            });
          },
          
            child: Text("Start booking", style: TextStyle(color: Colors.white),),
            color: Colors.red,
        ),
      ),
    );
  }
}