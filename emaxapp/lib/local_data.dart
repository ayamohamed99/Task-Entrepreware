
  import 'package:flutter/material.dart';

TextEditingController bodycontrallerD = TextEditingController();
  TextEditingController bodycontrallerW = TextEditingController();
  TextEditingController bodycontrallerM = TextEditingController();
  List<String> titleEN = ["Daily", "Weekly", "Monthly"];
  List<String> images = [
    'assets/image/d.jpg',
    'assets/image/w.jpg',
    'assets/image/m.jpg'
  ];
  List<Color> color = [Colors.yellow[600], Colors.orange[500], Colors.red[500]];
  List<Color> titleColor = [
    Colors.red[500],
    Colors.yellow[600],
    Colors.orange[500]
  ];




//  Widget _listview(int indexgrid, int index, var day, var week, var month) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.all(3.0),
//       child: Container(
//         width: size.width,
//         child: InkWell(
//           onTap: (){
            // setState(() {
            //         indexgrid == 0
            //             ? day[index].check = !day[index].check
            //             : indexgrid == 1
            //                 ? week[index].check =
            //                     !week[index].check
            //                 : month[index].check =
            //                     !month[index].check;
            //       });
//           },
//           child: Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   (index + 1).toString() + ")",
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 SizedBox(width: 5),
//                 Text(
//                   indexgrid == 0
//                       ? day[index].taskbody
//                       : indexgrid == 1
//                           ? week[index].taskbody
//                           : month[index].taskbody,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 18,
                    // decoration: (indexgrid == 0 && day[index].check == true)
                    //     ? TextDecoration.lineThrough
                    //     : (indexgrid == 1 && week[index].check == true)
                    //         ? TextDecoration.lineThrough
                    //         : (indexgrid == 2 && month[index].check == true)
                    //             ? TextDecoration.lineThrough
                    //             : TextDecoration.none,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
