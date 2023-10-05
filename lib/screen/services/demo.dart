// return Container(
//   height: 706,
//   decoration: const ShapeDecoration(
//     shape: SmoothRectangleBorder(
//       borderRadius: SmoothBorderRadius.only(
//         topLeft: SmoothRadius(
//           cornerRadius: 10,
//           cornerSmoothing: 1,
//         ),
//         topRight: SmoothRadius(
//           cornerRadius: 20,
//           cornerSmoothing: 0.4,
//         ),
//       ),
//     ),
//   ),
//   child: SingleChildScrollView(
//     child: Column(children: [
//       ListTile(
//           title: const Text("Filter by (1)",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold)),
//           trailing: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.close))),
//       Container(
//           margin: const EdgeInsets.only(
//               right: 24, left: 24),
//           padding: const EdgeInsets.all(8),
//           alignment: Alignment.center,
//           height: height * 0.08,
//           decoration: const BoxDecoration(
//               color: Color(0xffF5F6F7),
//               borderRadius: BorderRadius.all(
//                   Radius.circular(45))),
//           child: Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                     onTap: () {
//                       setState(() {
//                         if (value.isSelected ==
//                             0) {
//                           value.isSelected = 1;
//                         } else {
//                           value.isSelected = 0;
//                         }
//                       });
//                     },
//                     child: Container(
//                         height: height * 0.1,
//                         width: width * 0.28,
//                         alignment:
//                             Alignment.center,
//                         decoration: BoxDecoration(
//                             color: value.isSelected == 0
//                                 ? const Color(
//                                     0xff5465FF)
//                                 : const Color(
//                                     0xffF5F6F7),
//                             borderRadius: const BorderRadius.only(
//                                 topLeft:
//                                     Radius.circular(
//                                         40),
//                                 bottomLeft:
//                                     Radius.circular(
//                                         40))),
//                         child: Text("Category",
//                             style: TextStyle(
//                                 color: value.isSelected == 0
//                                     ? Colors.white
//                                     : Colors.black)))),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       if (value.isSelected ==
//                           1) {
//                         value.isSelected = 2;
//                       } else {
//                         value.isSelected = 1;
//                       }
//                     });
//                   },
//                   child: Container(
//                       height: height * 0.1,
//                       width: width * 0.28,
//                       alignment:
//                           Alignment.center,
//                       decoration: BoxDecoration(
//                           color: value.isSelected ==
//                                   1
//                               ? const Color(
//                                   0xff5465FF)
//                               : const Color(
//                                   0xffF5F6F7)),
//                       child: Text(
//                         "Price & rate",
//                         style: TextStyle(
//                             color:
//                                 value.isSelected == 1
//                                     ? Colors
//                                         .white
//                                     : Colors
//                                         .black),
//                       )),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       if (value.isSelected ==
//                           2) {
//                         value.isSelected = 0;
//                       } else {
//                         value.isSelected = 2;
//                       }
//                     });
//                   },
//                   child: Container(
//                       height: height * 0.1,
//                       width: width * 0.28,
//                       alignment: Alignment
//                           .center,
//                       decoration: BoxDecoration(
//                           color: value.isSelected ==
//                                   2
//                               ? const Color(
//                                   0xff5465FF)
//                               : const Color(
//                                   0xffF5F6F7),
//                           borderRadius:
//                               const BorderRadius
//                                       .only(
//                                   topRight: Radius
//                                       .circular(
//                                           40),
//                                   bottomRight:
//                                       Radius.circular(
//                                           40))),
//                       child: Text(
//                         "Distance",
//                         style: TextStyle(
//                             color:
//                                 value.isSelected == 2
//                                     ? Colors
//                                         .white
//                                     : Colors
//                                         .black),
//                       )),
//                 )
//               ])),
//       const SizedBox(height: 10),
//       const ListTile(
//           title: Text("Category list")),
//       TextFieldCommon1(
//           prefixIcon: SvgPicture.asset(
//                   "assets/svg/search.svg")
//               .padding(all: 12)),
//       ListView.builder(
//           physics:
//               const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: value.categoryList.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//                 leading: SvgPicture.asset(
//                     value.categorySvg[index]),
//                 title: Text(
//                     value.categoryList[index]));
//           }),
//       Row(
//           mainAxisAlignment:
//               MainAxisAlignment.center,
//           children: [
//             Container(
//                 margin: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                         color: const Color(
//                             0xff5465FF)),
//                     borderRadius:
//                         const BorderRadius.all(
//                             Radius.circular(
//                                 8))),
//                 height: height * 0.06,
//                 alignment: Alignment.center,
//                 width: width * 0.4,
//                 child: const Text("Clear all",
//                     style: TextStyle(
//                         color:
//                             Color(0xff5465FF),
//                         fontSize: 16))),
//             Container(
//                 margin: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     color:
//                         const Color(0xff5465FF),
//                     border: Border.all(
//                         color: const Color(
//                             0xff5465FF)),
//                     borderRadius:
//                         const BorderRadius.all(
//                             Radius.circular(
//                                 8))),
//                 height: height * 0.06,
//                 alignment: Alignment.center,
//                 width: width * 0.4,
//                 child: const Text("Apply",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16)))
//           ]),
//     ]),
//   ),
// );