import 'package:flutter/material.dart';
import 'package:hackthoneventproject/models/category.dart';
import 'package:hackthoneventproject/widgets/app_text_field.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key,required this.categories}) : super(key: key);
  final List<Category> categories;

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  late TextEditingController _nameTextController;
  late TextEditingController _dateTextController;
  late TextEditingController _timeTextController;
  late TextEditingController _hourTextController;
  late TextEditingController _locationTextController;
  late TextEditingController _informationTextController;

  int dropdownValue=1 ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _dateTextController = TextEditingController();
    _timeTextController = TextEditingController();
    _hourTextController = TextEditingController();
    _locationTextController = TextEditingController();
    _informationTextController = TextEditingController();


  }


  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _dateTextController.dispose();
    _timeTextController.dispose();
    _hourTextController.dispose();
    _locationTextController.dispose();
    _informationTextController.dispose();

    super.dispose();
  }
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime, );

    if (picked_s != null && picked_s != selectedTime )
      setState(() {
        selectedTime = picked_s;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New event'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        children: [
          AppTextField(controller: _nameTextController, hint: 'Enter event name'),
          // Row(
//
          //   children: [
          //     Expanded(child: AppTextField(controller: _dateTextController, hint: '21 December 2021')),
          //     Expanded(child:AppTextField(controller: _timeTextController, hint: '12:00 pm')),
//
          //   ],
          // ),
          SizedBox(height: 10,),

          Row(

            children: [
             // Expanded(child: Text("${selectedDate.toLocal()}".split(' ')[0]),),

              Expanded(child: AppTextField(
                controller: _dateTextController,
                hint:'21 December 2021' ,
                ontap:() => _selectDate(context) ,
              )),
              SizedBox(width: 10,),
              Expanded(child: AppTextField(
                controller: _timeTextController,
                hint:'12:00 pm' ,
                ontap:() => _selectTime(context) ,
              ))

            ],
          ),


          SizedBox(height: 20.0,),
          AppTextField(controller: _hourTextController, hint: 'No. of hours'),

          DropdownButton<int>(
            isExpanded: true,
            value: dropdownValue,
            elevation: 16,
            hint:const Text('Select City'),

            onChanged: (int? newValue) {
              print(dropdownValue);
              if(newValue!=null)
                setState(() {
                  dropdownValue = newValue;
                });

            },
            items: widget.categories
                .map<DropdownMenuItem<int>>((Category value) {
              return DropdownMenuItem<int>(
                value: value.id,
                child: Text(value.nameEn),
              );
            }).toList(),
          ),
          AppTextField(controller: _locationTextController, hint: 'Location'),
          SizedBox(height: 10,),
          AppTextField(controller: _informationTextController, hint: 'information',maxlength: 100,)

        ],
      ),

    );
  }
}
