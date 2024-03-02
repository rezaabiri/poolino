
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';



class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int _selectedFruit = 0;
  final List<String> _fruitNames = <String>[
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];
  List<String> year = <String>[
    '1401',
    '1402',
    '1403',
    '1404',
    '1405',
    '1406',
    '1407',
    '1408',
    '1409',
    '1410',
    '1411',
    '1412',
  ];
  List<String> day = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 32, right: 32, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: Text("سال", style: TextStyle(fontFamily: "medium"),)),
                Center(child: Text("ماه", style: TextStyle(fontFamily: "medium"))),
                Center(child: Text("روز", style: TextStyle(fontFamily: "medium"))),
              ],
            ),
          ),
          dashLine(),

          SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: SizedBox(
                  height: 100,
                  child: CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    diameterRatio: 1.2,
                    itemExtent: 40,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedFruit,
                    ),
                    onSelectedItemChanged: (int selectedItem) {
                      print(selectedItem);
                      setState(() {
                        _selectedFruit = selectedItem;
                      });
                    },
                    children: List<Widget>.generate(year.length, (int index) {
                      return Center(child: Text(year[index], style: TextStyle(fontFamily: "medium", fontSize: 14),));
                    }),
                  ),
                ),
              ),
              Text("/"),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    diameterRatio: 1.2,
                    itemExtent: 40,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedFruit,
                    ),
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedFruit = selectedItem;
                      });
                    },
                    children: List<Widget>.generate(_fruitNames.length, (int index) {
                      return Center(child: Text(_fruitNames[index], style: TextStyle(fontFamily: "medium", fontSize: 14),));
                    }),
                  ),
                ),
              ),
              Text("/"),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    diameterRatio: 1.2,
                    itemExtent: 40,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedFruit,
                    ),
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedFruit = selectedItem;
                      });
                    },
                    children: List<Widget>.generate(day.length, (int index) {
                      return Center(child: Text(day[index], style: TextStyle(fontFamily: "medium", fontSize: 14),));
                    }),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 16,),
          dashLine(),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: ButtonPrimary(text: "تایید", isEnabled: true, onPressed: (){},),
          )

        ],
      ),
    );
  }
  DottedLine dashLine(){
    return const DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 6.0,
      dashColor: Colors.grey,
      dashRadius: 2.0,
      dashGapLength: 4.0,
    );
  }

}
