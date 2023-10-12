import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2727273);
    path_0.cubicTo(0, size.height * 0.1441625, 0, size.height * 0.07988000,
        size.width * 0.03514720, size.height * 0.03994000);
    path_0.cubicTo(size.width * 0.07029440, 0, size.width * 0.1268630, 0,
        size.width * 0.2400000, 0);
    path_0.lineTo(size.width * 0.7600000, 0);
    path_0.cubicTo(size.width * 0.8731370, 0, size.width * 0.9297060, 0,
        size.width * 0.9648530, size.height * 0.03994000);
    path_0.cubicTo(size.width, size.height * 0.07988000, size.width,
        size.height * 0.1441625, size.width, size.height * 0.2727273);
    path_0.lineTo(size.width, size.height * 0.3636364);
    path_0.cubicTo(
        size.width,
        size.height * 0.3671250,
        size.width,
        size.height * 0.3688693,
        size.width * 0.9987820,
        size.height * 0.3735773);
    path_0.cubicTo(
        size.width * 0.9975650,
        size.height * 0.3782841,
        size.width * 0.9815450,
        size.height * 0.4065750,
        size.width * 0.9495070,
        size.height * 0.4631545);
    path_0.cubicTo(
        size.width * 0.9434900,
        size.height * 0.4737795,
        size.width * 0.9400000,
        size.height * 0.4864261,
        size.width * 0.9400000,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.9400000,
        size.height * 0.5135739,
        size.width * 0.9434900,
        size.height * 0.5262205,
        size.width * 0.9495070,
        size.height * 0.5368455);
    path_0.cubicTo(
        size.width * 0.9815450,
        size.height * 0.5934250,
        size.width * 0.9975650,
        size.height * 0.6217159,
        size.width * 0.9987820,
        size.height * 0.6264227);
    path_0.cubicTo(size.width, size.height * 0.6311307, size.width,
        size.height * 0.6328750, size.width, size.height * 0.6363636);
    path_0.lineTo(size.width, size.height * 0.7272727);
    path_0.cubicTo(
        size.width,
        size.height * 0.8558375,
        size.width,
        size.height * 0.9201205,
        size.width * 0.9648530,
        size.height * 0.9600602);
    path_0.cubicTo(size.width * 0.9297060, size.height, size.width * 0.8731370,
        size.height, size.width * 0.7600000, size.height);
    path_0.lineTo(size.width * 0.2400000, size.height);
    path_0.cubicTo(size.width * 0.1268630, size.height, size.width * 0.07029440,
        size.height, size.width * 0.03514720, size.height * 0.9600602);
    path_0.cubicTo(0, size.height * 0.9201205, 0, size.height * 0.8558375, 0,
        size.height * 0.7272727);
    path_0.lineTo(0, size.height * 0.6302409);
    path_0.cubicTo(0, size.height * 0.6280261, 0, size.height * 0.6335636,
        size.width * 0.0008729170, size.height * 0.6295420);
    path_0.cubicTo(
        size.width * 0.001745830,
        size.height * 0.6255205,
        size.width * 0.01573830,
        size.height * 0.5952477,
        size.width * 0.04372330,
        size.height * 0.5347045);
    path_0.cubicTo(
        size.width * 0.04773190,
        size.height * 0.5260318,
        size.width * 0.05000000,
        size.height * 0.5161580,
        size.width * 0.05000000,
        size.height * 0.5056818);
    path_0.cubicTo(
        size.width * 0.05000000,
        size.height * 0.4952057,
        size.width * 0.04773190,
        size.height * 0.4853318,
        size.width * 0.04372330,
        size.height * 0.4766591);
    path_0.cubicTo(
        size.width * 0.01573830,
        size.height * 0.4161159,
        size.width * 0.001745830,
        size.height * 0.3858432,
        size.width * 0.0008729170,
        size.height * 0.3818216);
    path_0.cubicTo(0, size.height * 0.3778000, 0, size.height * 0.3833375, 0,
        size.height * 0.3811227);
    path_0.lineTo(0, size.height * 0.2727273);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.2727273);
    path_1.cubicTo(0, size.height * 0.1441625, 0, size.height * 0.07988000,
        size.width * 0.03514720, size.height * 0.03994000);
    path_1.cubicTo(size.width * 0.07029440, 0, size.width * 0.1268630, 0,
        size.width * 0.2400000, 0);
    path_1.lineTo(size.width * 0.7600000, 0);
    path_1.cubicTo(size.width * 0.8731370, 0, size.width * 0.9297060, 0,
        size.width * 0.9648530, size.height * 0.03994000);
    path_1.cubicTo(size.width, size.height * 0.07988000, size.width,
        size.height * 0.1441625, size.width, size.height * 0.2727273);
    path_1.lineTo(size.width, size.height * 0.3636364);
    path_1.cubicTo(
        size.width,
        size.height * 0.3671250,
        size.width,
        size.height * 0.3688693,
        size.width * 0.9987820,
        size.height * 0.3735773);
    path_1.cubicTo(
        size.width * 0.9975650,
        size.height * 0.3782841,
        size.width * 0.9815450,
        size.height * 0.4065750,
        size.width * 0.9495070,
        size.height * 0.4631545);
    path_1.cubicTo(
        size.width * 0.9434900,
        size.height * 0.4737795,
        size.width * 0.9400000,
        size.height * 0.4864261,
        size.width * 0.9400000,
        size.height * 0.5000000);
    path_1.cubicTo(
        size.width * 0.9400000,
        size.height * 0.5135739,
        size.width * 0.9434900,
        size.height * 0.5262205,
        size.width * 0.9495070,
        size.height * 0.5368455);
    path_1.cubicTo(
        size.width * 0.9815450,
        size.height * 0.5934250,
        size.width * 0.9975650,
        size.height * 0.6217159,
        size.width * 0.9987820,
        size.height * 0.6264227);
    path_1.cubicTo(size.width, size.height * 0.6311307, size.width,
        size.height * 0.6328750, size.width, size.height * 0.6363636);
    path_1.lineTo(size.width, size.height * 0.7272727);
    path_1.cubicTo(
        size.width,
        size.height * 0.8558375,
        size.width,
        size.height * 0.9201205,
        size.width * 0.9648530,
        size.height * 0.9600602);
    path_1.cubicTo(size.width * 0.9297060, size.height, size.width * 0.8731370,
        size.height, size.width * 0.7600000, size.height);
    path_1.lineTo(size.width * 0.2400000, size.height);
    path_1.cubicTo(size.width * 0.1268630, size.height, size.width * 0.07029440,
        size.height, size.width * 0.03514720, size.height * 0.9600602);
    path_1.cubicTo(0, size.height * 0.9201205, 0, size.height * 0.8558375, 0,
        size.height * 0.7272727);
    path_1.lineTo(0, size.height * 0.6302409);
    path_1.cubicTo(0, size.height * 0.6280261, 0, size.height * 0.6335636,
        size.width * 0.0008729170, size.height * 0.6295420);
    path_1.cubicTo(
        size.width * 0.001745830,
        size.height * 0.6255205,
        size.width * 0.01573830,
        size.height * 0.5952477,
        size.width * 0.04372330,
        size.height * 0.5347045);
    path_1.cubicTo(
        size.width * 0.04773190,
        size.height * 0.5260318,
        size.width * 0.05000000,
        size.height * 0.5161580,
        size.width * 0.05000000,
        size.height * 0.5056818);
    path_1.cubicTo(
        size.width * 0.05000000,
        size.height * 0.4952057,
        size.width * 0.04773190,
        size.height * 0.4853318,
        size.width * 0.04372330,
        size.height * 0.4766591);
    path_1.cubicTo(
        size.width * 0.01573830,
        size.height * 0.4161159,
        size.width * 0.001745830,
        size.height * 0.3858432,
        size.width * 0.0008729170,
        size.height * 0.3818216);
    path_1.cubicTo(0, size.height * 0.3778000, 0, size.height * 0.3833375, 0,
        size.height * 0.3811227);
    path_1.lineTo(0, size.height * 0.2727273);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff5465FF).withOpacity(0.1);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.04372330, size.height * 0.4766591);
    path_2.lineTo(size.width * 0.05257630, size.height * 0.4713750);
    path_2.lineTo(size.width * 0.04372330, size.height * 0.4766591);
    path_2.close();
    path_2.moveTo(size.width * 0.0008729170, size.height * 0.6295420);
    path_2.lineTo(size.width * -0.008836110, size.height * 0.6268205);
    path_2.lineTo(size.width * 0.0008729170, size.height * 0.6295420);
    path_2.close();
    path_2.moveTo(size.width * 0.9987820, size.height * 0.6264227);
    path_2.lineTo(size.width * 1.008380, size.height * 0.6232182);
    path_2.lineTo(size.width * 0.9987820, size.height * 0.6264227);
    path_2.close();
    path_2.moveTo(size.width * 0.9495070, size.height * 0.4631545);
    path_2.lineTo(size.width * 0.9410970, size.height * 0.4570057);
    path_2.lineTo(size.width * 0.9495070, size.height * 0.4631545);
    path_2.close();
    path_2.moveTo(size.width * 0.9987820, size.height * 0.3735773);
    path_2.lineTo(size.width * 0.9891880, size.height * 0.3703727);
    path_2.lineTo(size.width * 0.9987820, size.height * 0.3735773);
    path_2.close();
    path_2.moveTo(size.width * 0.02807610, size.height * 0.03190466);
    path_2.cubicTo(
        size.width * 0.008334840,
        size.height * 0.05433795,
        size.width * -0.0009749460,
        size.height * 0.08319125,
        size.width * -0.005517430,
        size.height * 0.1215852);
    path_2.cubicTo(
        size.width * -0.01002120,
        size.height * 0.1596523,
        size.width * -0.01000000,
        size.height * 0.2087659,
        size.width * -0.01000000,
        size.height * 0.2727273);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.2727273);
    path_2.cubicTo(
        size.width * 0.01000000,
        size.height * 0.2081239,
        size.width * 0.01002120,
        size.height * 0.1608136,
        size.width * 0.01430420,
        size.height * 0.1246136);
    path_2.cubicTo(
        size.width * 0.01854850,
        size.height * 0.08873989,
        size.width * 0.02681240,
        size.height * 0.06548205,
        size.width * 0.04221830,
        size.height * 0.04797534);
    path_2.lineTo(size.width * 0.02807610, size.height * 0.03190466);
    path_2.close();
    path_2.moveTo(size.width * 0.2400000, size.height * -0.01136364);
    path_2.cubicTo(
        size.width * 0.1837140,
        size.height * -0.01136364,
        size.width * 0.1404940,
        size.height * -0.01138773,
        size.width * 0.1069950,
        size.height * -0.006269807);
    path_2.cubicTo(
        size.width * 0.07320840,
        size.height * -0.001107893,
        size.width * 0.04781740,
        size.height * 0.009471398,
        size.width * 0.02807610,
        size.height * 0.03190466);
    path_2.lineTo(size.width * 0.04221830, size.height * 0.04797534);
    path_2.cubicTo(
        size.width * 0.05762420,
        size.height * 0.03046864,
        size.width * 0.07809110,
        size.height * 0.02107784,
        size.width * 0.1096600,
        size.height * 0.01625477);
    path_2.cubicTo(
        size.width * 0.1415160,
        size.height * 0.01138773,
        size.width * 0.1831490,
        size.height * 0.01136364,
        size.width * 0.2400000,
        size.height * 0.01136364);
    path_2.lineTo(size.width * 0.2400000, size.height * -0.01136364);
    path_2.close();
    path_2.moveTo(size.width * 0.7600000, size.height * -0.01136364);
    path_2.lineTo(size.width * 0.2400000, size.height * -0.01136364);
    path_2.lineTo(size.width * 0.2400000, size.height * 0.01136364);
    path_2.lineTo(size.width * 0.7600000, size.height * 0.01136364);
    path_2.lineTo(size.width * 0.7600000, size.height * -0.01136364);
    path_2.close();
    path_2.moveTo(size.width * 0.9719240, size.height * 0.03190466);
    path_2.cubicTo(
        size.width * 0.9521830,
        size.height * 0.009471398,
        size.width * 0.9267920,
        size.height * -0.001107893,
        size.width * 0.8930050,
        size.height * -0.006269807);
    path_2.cubicTo(
        size.width * 0.8595060,
        size.height * -0.01138773,
        size.width * 0.8162860,
        size.height * -0.01136364,
        size.width * 0.7600000,
        size.height * -0.01136364);
    path_2.lineTo(size.width * 0.7600000, size.height * 0.01136364);
    path_2.cubicTo(
        size.width * 0.8168510,
        size.height * 0.01136364,
        size.width * 0.8584840,
        size.height * 0.01138773,
        size.width * 0.8903400,
        size.height * 0.01625477);
    path_2.cubicTo(
        size.width * 0.9219090,
        size.height * 0.02107784,
        size.width * 0.9423760,
        size.height * 0.03046864,
        size.width * 0.9577820,
        size.height * 0.04797534);
    path_2.lineTo(size.width * 0.9719240, size.height * 0.03190466);
    path_2.close();
    path_2.moveTo(size.width * 1.010000, size.height * 0.2727273);
    path_2.cubicTo(
        size.width * 1.010000,
        size.height * 0.2087659,
        size.width * 1.010020,
        size.height * 0.1596523,
        size.width * 1.005520,
        size.height * 0.1215852);
    path_2.cubicTo(
        size.width * 1.000970,
        size.height * 0.08319136,
        size.width * 0.9916650,
        size.height * 0.05433795,
        size.width * 0.9719240,
        size.height * 0.03190466);
    path_2.lineTo(size.width * 0.9577820, size.height * 0.04797534);
    path_2.cubicTo(
        size.width * 0.9731880,
        size.height * 0.06548205,
        size.width * 0.9814510,
        size.height * 0.08873989,
        size.width * 0.9856960,
        size.height * 0.1246136);
    path_2.cubicTo(
        size.width * 0.9899790,
        size.height * 0.1608136,
        size.width * 0.9900000,
        size.height * 0.2081239,
        size.width * 0.9900000,
        size.height * 0.2727273);
    path_2.lineTo(size.width * 1.010000, size.height * 0.2727273);
    path_2.close();
    path_2.moveTo(size.width * 1.010000, size.height * 0.3636364);
    path_2.lineTo(size.width * 1.010000, size.height * 0.2727273);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.2727273);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.3636364);
    path_2.lineTo(size.width * 1.010000, size.height * 0.3636364);
    path_2.close();
    path_2.moveTo(size.width * 0.9500000, size.height * 0.5000000);
    path_2.cubicTo(
        size.width * 0.9500000,
        size.height * 0.4886716,
        size.width * 0.9529070,
        size.height * 0.4781500,
        size.width * 0.9579160,
        size.height * 0.4693034);
    path_2.lineTo(size.width * 0.9410970, size.height * 0.4570057);
    path_2.cubicTo(
        size.width * 0.9340740,
        size.height * 0.4694091,
        size.width * 0.9300000,
        size.height * 0.4841818,
        size.width * 0.9300000,
        size.height * 0.5000000);
    path_2.lineTo(size.width * 0.9500000, size.height * 0.5000000);
    path_2.close();
    path_2.moveTo(size.width * 0.9579160, size.height * 0.5306966);
    path_2.cubicTo(
        size.width * 0.9529070,
        size.height * 0.5218500,
        size.width * 0.9500000,
        size.height * 0.5113284,
        size.width * 0.9500000,
        size.height * 0.5000000);
    path_2.lineTo(size.width * 0.9300000, size.height * 0.5000000);
    path_2.cubicTo(
        size.width * 0.9300000,
        size.height * 0.5158182,
        size.width * 0.9340740,
        size.height * 0.5305909,
        size.width * 0.9410970,
        size.height * 0.5429943);
    path_2.lineTo(size.width * 0.9579160, size.height * 0.5306966);
    path_2.close();
    path_2.moveTo(size.width * 1.010000, size.height * 0.7272727);
    path_2.lineTo(size.width * 1.010000, size.height * 0.6363636);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.6363636);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.7272727);
    path_2.lineTo(size.width * 1.010000, size.height * 0.7272727);
    path_2.close();
    path_2.moveTo(size.width * 0.9719240, size.height * 0.9680955);
    path_2.cubicTo(
        size.width * 0.9916650,
        size.height * 0.9456625,
        size.width * 1.000970,
        size.height * 0.9168091,
        size.width * 1.005520,
        size.height * 0.8784148);
    path_2.cubicTo(
        size.width * 1.010020,
        size.height * 0.8403477,
        size.width * 1.010000,
        size.height * 0.7912341,
        size.width * 1.010000,
        size.height * 0.7272727);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.7272727);
    path_2.cubicTo(
        size.width * 0.9900000,
        size.height * 0.7918761,
        size.width * 0.9899790,
        size.height * 0.8391864,
        size.width * 0.9856960,
        size.height * 0.8753864);
    path_2.cubicTo(
        size.width * 0.9814510,
        size.height * 0.9112602,
        size.width * 0.9731880,
        size.height * 0.9345182,
        size.width * 0.9577820,
        size.height * 0.9520250);
    path_2.lineTo(size.width * 0.9719240, size.height * 0.9680955);
    path_2.close();
    path_2.moveTo(size.width * 0.7600000, size.height * 1.011364);
    path_2.cubicTo(
        size.width * 0.8162860,
        size.height * 1.011364,
        size.width * 0.8595060,
        size.height * 1.011387,
        size.width * 0.8930050,
        size.height * 1.006269);
    path_2.cubicTo(
        size.width * 0.9267920,
        size.height * 1.001108,
        size.width * 0.9521830,
        size.height * 0.9905284,
        size.width * 0.9719240,
        size.height * 0.9680955);
    path_2.lineTo(size.width * 0.9577820, size.height * 0.9520250);
    path_2.cubicTo(
        size.width * 0.9423760,
        size.height * 0.9695318,
        size.width * 0.9219090,
        size.height * 0.9789216,
        size.width * 0.8903400,
        size.height * 0.9837455);
    path_2.cubicTo(
        size.width * 0.8584840,
        size.height * 0.9886125,
        size.width * 0.8168510,
        size.height * 0.9886364,
        size.width * 0.7600000,
        size.height * 0.9886364);
    path_2.lineTo(size.width * 0.7600000, size.height * 1.011364);
    path_2.close();
    path_2.moveTo(size.width * 0.2400000, size.height * 1.011364);
    path_2.lineTo(size.width * 0.7600000, size.height * 1.011364);
    path_2.lineTo(size.width * 0.7600000, size.height * 0.9886364);
    path_2.lineTo(size.width * 0.2400000, size.height * 0.9886364);
    path_2.lineTo(size.width * 0.2400000, size.height * 1.011364);
    path_2.close();
    path_2.moveTo(size.width * 0.02807610, size.height * 0.9680955);
    path_2.cubicTo(
        size.width * 0.04781740,
        size.height * 0.9905284,
        size.width * 0.07320840,
        size.height * 1.001108,
        size.width * 0.1069950,
        size.height * 1.006269);
    path_2.cubicTo(
        size.width * 0.1404940,
        size.height * 1.011387,
        size.width * 0.1837140,
        size.height * 1.011364,
        size.width * 0.2400000,
        size.height * 1.011364);
    path_2.lineTo(size.width * 0.2400000, size.height * 0.9886364);
    path_2.cubicTo(
        size.width * 0.1831490,
        size.height * 0.9886364,
        size.width * 0.1415160,
        size.height * 0.9886125,
        size.width * 0.1096600,
        size.height * 0.9837455);
    path_2.cubicTo(
        size.width * 0.07809110,
        size.height * 0.9789216,
        size.width * 0.05762420,
        size.height * 0.9695318,
        size.width * 0.04221830,
        size.height * 0.9520250);
    path_2.lineTo(size.width * 0.02807610, size.height * 0.9680955);
    path_2.close();
    path_2.moveTo(size.width * -0.01000000, size.height * 0.7272727);
    path_2.cubicTo(
        size.width * -0.01000000,
        size.height * 0.7912341,
        size.width * -0.01002120,
        size.height * 0.8403477,
        size.width * -0.005517430,
        size.height * 0.8784148);
    path_2.cubicTo(
        size.width * -0.0009749460,
        size.height * 0.9168091,
        size.width * 0.008334830,
        size.height * 0.9456625,
        size.width * 0.02807610,
        size.height * 0.9680955);
    path_2.lineTo(size.width * 0.04221830, size.height * 0.9520250);
    path_2.cubicTo(
        size.width * 0.02681240,
        size.height * 0.9345182,
        size.width * 0.01854850,
        size.height * 0.9112602,
        size.width * 0.01430420,
        size.height * 0.8753864);
    path_2.cubicTo(
        size.width * 0.01002120,
        size.height * 0.8391864,
        size.width * 0.01000000,
        size.height * 0.7918761,
        size.width * 0.01000000,
        size.height * 0.7272727);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.7272727);
    path_2.close();
    path_2.moveTo(size.width * -0.01000000, size.height * 0.6302409);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.7272727);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.7272727);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.6302409);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.6302409);
    path_2.close();
    path_2.moveTo(size.width * 0.04000000, size.height * 0.5056818);
    path_2.cubicTo(
        size.width * 0.04000000,
        size.height * 0.5142727,
        size.width * 0.03814360,
        size.height * 0.5223386,
        size.width * 0.03487020,
        size.height * 0.5294193);
    path_2.lineTo(size.width * 0.05257630, size.height * 0.5399886);
    path_2.cubicTo(
        size.width * 0.05732020,
        size.height * 0.5297250,
        size.width * 0.06000000,
        size.height * 0.5180420,
        size.width * 0.06000000,
        size.height * 0.5056818);
    path_2.lineTo(size.width * 0.04000000, size.height * 0.5056818);
    path_2.close();
    path_2.moveTo(size.width * 0.03487020, size.height * 0.4819443);
    path_2.cubicTo(
        size.width * 0.03814360,
        size.height * 0.4890250,
        size.width * 0.04000000,
        size.height * 0.4970909,
        size.width * 0.04000000,
        size.height * 0.5056818);
    path_2.lineTo(size.width * 0.06000000, size.height * 0.5056818);
    path_2.cubicTo(
        size.width * 0.06000000,
        size.height * 0.4933216,
        size.width * 0.05732020,
        size.height * 0.4816386,
        size.width * 0.05257630,
        size.height * 0.4713750);
    path_2.lineTo(size.width * 0.03487020, size.height * 0.4819443);
    path_2.close();
    path_2.moveTo(size.width * -0.01000000, size.height * 0.2727273);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.3811227);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.3811227);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.2727273);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.2727273);
    path_2.close();
    path_2.moveTo(size.width * 0.05257630, size.height * 0.4713750);
    path_2.cubicTo(
        size.width * 0.03857560,
        size.height * 0.4410852,
        size.width * 0.02810170,
        size.height * 0.4184261,
        size.width * 0.02101670,
        size.height * 0.4028318);
    path_2.cubicTo(
        size.width * 0.01747080,
        size.height * 0.3950273,
        size.width * 0.01480650,
        size.height * 0.3890648,
        size.width * 0.01298450,
        size.height * 0.3848307);
    path_2.cubicTo(
        size.width * 0.01207060,
        size.height * 0.3827068,
        size.width * 0.01140340,
        size.height * 0.3810989,
        size.width * 0.01095420,
        size.height * 0.3799511);
    path_2.cubicTo(
        size.width * 0.01038750,
        size.height * 0.3785034,
        size.width * 0.01044680,
        size.height * 0.3784784,
        size.width * 0.01058190,
        size.height * 0.3791011);
    path_2.lineTo(size.width * -0.008836110, size.height * 0.3845432);
    path_2.cubicTo(
        size.width * -0.008482710,
        size.height * 0.3861716,
        size.width * -0.007795250,
        size.height * 0.3879727,
        size.width * -0.007320350,
        size.height * 0.3891852);
    path_2.cubicTo(
        size.width * -0.006727910,
        size.height * 0.3907000,
        size.width * -0.005940060,
        size.height * 0.3925898,
        size.width * -0.004982180,
        size.height * 0.3948148);
    path_2.cubicTo(
        size.width * -0.003060520,
        size.height * 0.3992807,
        size.width * -0.0003140440,
        size.height * 0.4054239,
        size.width * 0.003245500,
        size.height * 0.4132580);
    path_2.cubicTo(
        size.width * 0.01037110,
        size.height * 0.4289420,
        size.width * 0.02088600,
        size.height * 0.4516898,
        size.width * 0.03487020,
        size.height * 0.4819443);
    path_2.lineTo(size.width * 0.05257630, size.height * 0.4713750);
    path_2.close();
    path_2.moveTo(size.width * -0.01000000, size.height * 0.3811227);
    path_2.cubicTo(
        size.width * -0.01000000,
        size.height * 0.3812545,
        size.width * -0.01000000,
        size.height * 0.3813818,
        size.width * -0.009999740,
        size.height * 0.3814852);
    path_2.cubicTo(
        size.width * -0.009999580,
        size.height * 0.3815489,
        size.width * -0.009999280,
        size.height * 0.3817455,
        size.width * -0.009994290,
        size.height * 0.3819455);
    path_2.cubicTo(
        size.width * -0.009992760,
        size.height * 0.3820068,
        size.width * -0.009989830,
        size.height * 0.3821102,
        size.width * -0.009984060,
        size.height * 0.3822364);
    path_2.cubicTo(
        size.width * -0.009979740,
        size.height * 0.3823307,
        size.width * -0.009967090,
        size.height * 0.3825955,
        size.width * -0.009933820,
        size.height * 0.3829307);
    path_2.cubicTo(
        size.width * -0.009917800,
        size.height * 0.3830932,
        size.width * -0.009882470,
        size.height * 0.3834227,
        size.width * -0.009811950,
        size.height * 0.3838341);
    path_2.cubicTo(
        size.width * -0.009775960,
        size.height * 0.3840443,
        size.width * -0.009715500,
        size.height * 0.3843670,
        size.width * -0.009619240,
        size.height * 0.3847545);
    path_2.cubicTo(
        size.width * -0.009533860,
        size.height * 0.3850977,
        size.width * -0.009354380,
        size.height * 0.3857636,
        size.width * -0.009022750,
        size.height * 0.3865545);
    path_2.cubicTo(
        size.width * -0.008862020,
        size.height * 0.3869205,
        size.width * -0.008450240,
        size.height * 0.3877341,
        size.width * -0.008192250,
        size.height * 0.3881750);
    path_2.cubicTo(
        size.width * -0.007822690,
        size.height * 0.3887386,
        size.width * -0.006848740,
        size.height * 0.3899409,
        size.width * -0.006227980,
        size.height * 0.3905523);
    path_2.cubicTo(
        size.width * -0.005348180,
        size.height * 0.3912648,
        size.width * -0.003183700,
        size.height * 0.3924364,
        size.width * -0.001905700,
        size.height * 0.3928205);
    path_2.cubicTo(
        size.width * -0.0004788980,
        size.height * 0.3930170,
        size.width * 0.002268260,
        size.height * 0.3927352,
        size.width * 0.003538790,
        size.height * 0.3922966);
    path_2.cubicTo(
        size.width * 0.004534620,
        size.height * 0.3917977,
        size.width * 0.006150640,
        size.height * 0.3906307,
        size.width * 0.006782390,
        size.height * 0.3900216);
    path_2.cubicTo(
        size.width * 0.007227660,
        size.height * 0.3895261,
        size.width * 0.007939300,
        size.height * 0.3885830,
        size.width * 0.008216330,
        size.height * 0.3881523);
    path_2.cubicTo(
        size.width * 0.008779120,
        size.height * 0.3872318,
        size.width * 0.009095070,
        size.height * 0.3864205,
        size.width * 0.009234430,
        size.height * 0.3860409);
    path_2.cubicTo(
        size.width * 0.009525680,
        size.height * 0.3852489,
        size.width * 0.009669460,
        size.height * 0.3845955,
        size.width * 0.009713740,
        size.height * 0.3843920);
    path_2.cubicTo(
        size.width * 0.009776990,
        size.height * 0.3841011,
        size.width * 0.009817400,
        size.height * 0.3838659,
        size.width * 0.009838890,
        size.height * 0.3837352);
    path_2.cubicTo(
        size.width * 0.009881960,
        size.height * 0.3834716,
        size.width * 0.009907580,
        size.height * 0.3832625,
        size.width * 0.009917560,
        size.height * 0.3831795);
    path_2.cubicTo(
        size.width * 0.009939420,
        size.height * 0.3829966,
        size.width * 0.009953490,
        size.height * 0.3828455,
        size.width * 0.009956850,
        size.height * 0.3828102);
    path_2.cubicTo(
        size.width * 0.009962170,
        size.height * 0.3827534,
        size.width * 0.009966950,
        size.height * 0.3827000,
        size.width * 0.009968740,
        size.height * 0.3826795);
    path_2.cubicTo(
        size.width * 0.009971440,
        size.height * 0.3826489,
        size.width * 0.009972560,
        size.height * 0.3826364,
        size.width * 0.009973920,
        size.height * 0.3826216);
    path_2.cubicTo(
        size.width * 0.009976290,
        size.height * 0.3825955,
        size.width * 0.009976440,
        size.height * 0.3825955,
        size.width * 0.009975090,
        size.height * 0.3826080);
    path_2.cubicTo(
        size.width * 0.009973880,
        size.height * 0.3826193,
        size.width * 0.009969310,
        size.height * 0.3826625,
        size.width * 0.009960550,
        size.height * 0.3827284);
    path_2.cubicTo(
        size.width * 0.009952360,
        size.height * 0.3827898,
        size.width * 0.009935160,
        size.height * 0.3829114,
        size.width * 0.009905330,
        size.height * 0.3830773);
    path_2.cubicTo(
        size.width * 0.009878000,
        size.height * 0.3832284,
        size.width * 0.009821340,
        size.height * 0.3835216,
        size.width * 0.009720300,
        size.height * 0.3838977);
    path_2.cubicTo(
        size.width * 0.009635300,
        size.height * 0.3842148,
        size.width * 0.009423800,
        size.height * 0.3849557,
        size.width * 0.008999990,
        size.height * 0.3858420);
    path_2.cubicTo(
        size.width * 0.008779840,
        size.height * 0.3863023,
        size.width * 0.008421360,
        size.height * 0.3869750,
        size.width * 0.007878720,
        size.height * 0.3877023);
    path_2.cubicTo(
        size.width * 0.007344680,
        size.height * 0.3884193,
        size.width * 0.006466070,
        size.height * 0.3894148,
        size.width * 0.005163990,
        size.height * 0.3902420);
    path_2.cubicTo(
        size.width * 0.003785500,
        size.height * 0.3911182,
        size.width * 0.002033480,
        size.height * 0.3917330,
        size.width * 0.00004949110,
        size.height * 0.3916716);
    path_2.cubicTo(
        size.width * -0.001897820,
        size.height * 0.3916102,
        size.width * -0.003499200,
        size.height * 0.3909159,
        size.width * -0.004654700,
        size.height * 0.3901534);
    path_2.cubicTo(
        size.width * -0.005765100,
        size.height * 0.3894205,
        size.width * -0.006528960,
        size.height * 0.3885875,
        size.width * -0.006993170,
        size.height * 0.3880057);
    path_2.cubicTo(
        size.width * -0.007470170,
        size.height * 0.3874068,
        size.width * -0.007799860,
        size.height * 0.3868614,
        size.width * -0.008006980,
        size.height * 0.3864852);
    path_2.cubicTo(
        size.width * -0.008406320,
        size.height * 0.3857602,
        size.width * -0.008622590,
        size.height * 0.3851693,
        size.width * -0.008702510,
        size.height * 0.3849409);
    path_2.cubicTo(
        size.width * -0.008868100,
        size.height * 0.3844705,
        size.width * -0.008901170,
        size.height * 0.3842432,
        size.width * -0.008836110,
        size.height * 0.3845432);
    path_2.lineTo(size.width * 0.01058190, size.height * 0.3791011);
    path_2.cubicTo(
        size.width * 0.01049700,
        size.height * 0.3787091,
        size.width * 0.01040190,
        size.height * 0.3783045,
        size.width * 0.01029430,
        size.height * 0.3778989);
    path_2.cubicTo(
        size.width * 0.01018980,
        size.height * 0.3775034,
        size.width * 0.01005190,
        size.height * 0.3770261,
        size.width * 0.009872080,
        size.height * 0.3765148);
    path_2.cubicTo(
        size.width * 0.009708620,
        size.height * 0.3760500,
        size.width * 0.009414780,
        size.height * 0.3752773,
        size.width * 0.008943400,
        size.height * 0.3744227);
    path_2.cubicTo(
        size.width * 0.008700270,
        size.height * 0.3739818,
        size.width * 0.008335940,
        size.height * 0.3733818,
        size.width * 0.007825650,
        size.height * 0.3727420);
    path_2.cubicTo(
        size.width * 0.007328140,
        size.height * 0.3721182,
        size.width * 0.006532320,
        size.height * 0.3712545,
        size.width * 0.005391230,
        size.height * 0.3705011);
    path_2.cubicTo(
        size.width * 0.004205030,
        size.height * 0.3697182,
        size.width * 0.002574250,
        size.height * 0.3690148,
        size.width * 0.0005987500,
        size.height * 0.3689523);
    path_2.cubicTo(
        size.width * -0.0003711080,
        size.height * 0.3689227,
        size.width * -0.001322000,
        size.height * 0.3690523,
        size.width * -0.002226920,
        size.height * 0.3693205);
    path_2.cubicTo(
        size.width * -0.003125590,
        size.height * 0.3695875,
        size.width * -0.003917750,
        size.height * 0.3699739,
        size.width * -0.004596680,
        size.height * 0.3704057);
    path_2.cubicTo(
        size.width * -0.005924550,
        size.height * 0.3712489,
        size.width * -0.006827770,
        size.height * 0.3722693,
        size.width * -0.007385310,
        size.height * 0.3730170);
    path_2.cubicTo(
        size.width * -0.007951440,
        size.height * 0.3737773,
        size.width * -0.008332300,
        size.height * 0.3744875,
        size.width * -0.008573760,
        size.height * 0.3749920);
    path_2.cubicTo(
        size.width * -0.008822690,
        size.height * 0.3755136,
        size.width * -0.008999770,
        size.height * 0.3759773,
        size.width * -0.009121760,
        size.height * 0.3763284);
    path_2.cubicTo(
        size.width * -0.009246360,
        size.height * 0.3766886,
        size.width * -0.009340150,
        size.height * 0.3770091,
        size.width * -0.009409580,
        size.height * 0.3772670);
    path_2.cubicTo(
        size.width * -0.009545150,
        size.height * 0.3777727,
        size.width * -0.009632500,
        size.height * 0.3782102,
        size.width * -0.009687100,
        size.height * 0.3785125);
    path_2.cubicTo(
        size.width * -0.009794640,
        size.height * 0.3791080,
        size.width * -0.009853600,
        size.height * 0.3796261,
        size.width * -0.009883030,
        size.height * 0.3799057);
    path_2.cubicTo(
        size.width * -0.009906410,
        size.height * 0.3801273,
        size.width * -0.009944440,
        size.height * 0.3805489,
        size.width * -0.009929570,
        size.height * 0.3803920);
    path_2.cubicTo(
        size.width * -0.009928410,
        size.height * 0.3803795,
        size.width * -0.009925650,
        size.height * 0.3803500,
        size.width * -0.009921660,
        size.height * 0.3803114);
    path_2.cubicTo(
        size.width * -0.009918070,
        size.height * 0.3802761,
        size.width * -0.009910490,
        size.height * 0.3802034,
        size.width * -0.009899280,
        size.height * 0.3801102);
    path_2.cubicTo(
        size.width * -0.009890610,
        size.height * 0.3800375,
        size.width * -0.009866200,
        size.height * 0.3798375,
        size.width * -0.009824250,
        size.height * 0.3795807);
    path_2.cubicTo(
        size.width * -0.009803330,
        size.height * 0.3794534,
        size.width * -0.009763460,
        size.height * 0.3792205,
        size.width * -0.009700730,
        size.height * 0.3789330);
    path_2.cubicTo(
        size.width * -0.009668510,
        size.height * 0.3787852,
        size.width * -0.009620640,
        size.height * 0.3785773,
        size.width * -0.009554460,
        size.height * 0.3783318);
    path_2.cubicTo(
        size.width * -0.009492220,
        size.height * 0.3781023,
        size.width * -0.009385510,
        size.height * 0.3777318,
        size.width * -0.009222920,
        size.height * 0.3772886);
    path_2.cubicTo(
        size.width * -0.009149950,
        size.height * 0.3770955,
        size.width * -0.008975740,
        size.height * 0.3766682,
        size.width * -0.008873010,
        size.height * 0.3764375);
    path_2.cubicTo(
        size.width * -0.008738920,
        size.height * 0.3761534,
        size.width * -0.008407170,
        size.height * 0.3755227,
        size.width * -0.008205530,
        size.height * 0.3751795);
    path_2.cubicTo(
        size.width * -0.007928610,
        size.height * 0.3747489,
        size.width * -0.007217090,
        size.height * 0.3738068,
        size.width * -0.006771920,
        size.height * 0.3733102);
    path_2.cubicTo(
        size.width * -0.006140290,
        size.height * 0.3727011,
        size.width * -0.004524380,
        size.height * 0.3715352,
        size.width * -0.003528660,
        size.height * 0.3710352);
    path_2.cubicTo(
        size.width * -0.002258250,
        size.height * 0.3705977,
        size.width * 0.0004888080,
        size.height * 0.3703159,
        size.width * 0.001915500,
        size.height * 0.3705125);
    path_2.cubicTo(
        size.width * 0.003193390,
        size.height * 0.3708955,
        size.width * 0.005357770,
        size.height * 0.3720682,
        size.width * 0.006237460,
        size.height * 0.3727795);
    path_2.cubicTo(
        size.width * 0.006858120,
        size.height * 0.3733909,
        size.width * 0.007831960,
        size.height * 0.3745943,
        size.width * 0.008201420,
        size.height * 0.3751568);
    path_2.cubicTo(
        size.width * 0.008459300,
        size.height * 0.3755977,
        size.width * 0.008870990,
        size.height * 0.3764102,
        size.width * 0.009031610,
        size.height * 0.3767761);
    path_2.cubicTo(
        size.width * 0.009363040,
        size.height * 0.3775670,
        size.width * 0.009542330,
        size.height * 0.3782330,
        size.width * 0.009627510,
        size.height * 0.3785750);
    path_2.cubicTo(
        size.width * 0.009723580,
        size.height * 0.3789614,
        size.width * 0.009783850,
        size.height * 0.3792830,
        size.width * 0.009819660,
        size.height * 0.3794920);
    path_2.cubicTo(
        size.width * 0.009889810,
        size.height * 0.3799023,
        size.width * 0.009924790,
        size.height * 0.3802284,
        size.width * 0.009940480,
        size.height * 0.3803875);
    path_2.cubicTo(
        size.width * 0.009973080,
        size.height * 0.3807159,
        size.width * 0.009985130,
        size.height * 0.3809727,
        size.width * 0.009988910,
        size.height * 0.3810545);
    path_2.cubicTo(
        size.width * 0.009994140,
        size.height * 0.3811693,
        size.width * 0.009996590,
        size.height * 0.3812580,
        size.width * 0.009997700,
        size.height * 0.3813023);
    path_2.cubicTo(
        size.width * 0.01000100,
        size.height * 0.3814341,
        size.width * 0.01000040,
        size.height * 0.3815182,
        size.width * 0.01000020,
        size.height * 0.3814182);
    path_2.cubicTo(
        size.width * 0.01000000,
        size.height * 0.3813568,
        size.width * 0.01000000,
        size.height * 0.3812682,
        size.width * 0.01000000,
        size.height * 0.3811227);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.3811227);
    path_2.close();
    path_2.moveTo(size.width * 0.01000000, size.height * 0.6302409);
    path_2.cubicTo(
        size.width * 0.01000000,
        size.height * 0.6300955,
        size.width * 0.01000000,
        size.height * 0.6300068,
        size.width * 0.01000020,
        size.height * 0.6299455);
    path_2.cubicTo(
        size.width * 0.01000040,
        size.height * 0.6298455,
        size.width * 0.01000100,
        size.height * 0.6299295,
        size.width * 0.009997700,
        size.height * 0.6300614);
    path_2.cubicTo(
        size.width * 0.009996590,
        size.height * 0.6301057,
        size.width * 0.009994140,
        size.height * 0.6301943,
        size.width * 0.009988910,
        size.height * 0.6303091);
    path_2.cubicTo(
        size.width * 0.009985130,
        size.height * 0.6303909,
        size.width * 0.009973080,
        size.height * 0.6306477,
        size.width * 0.009940480,
        size.height * 0.6309761);
    path_2.cubicTo(
        size.width * 0.009924790,
        size.height * 0.6311352,
        size.width * 0.009889810,
        size.height * 0.6314614,
        size.width * 0.009819660,
        size.height * 0.6318716);
    path_2.cubicTo(
        size.width * 0.009783850,
        size.height * 0.6320807,
        size.width * 0.009723580,
        size.height * 0.6324023,
        size.width * 0.009627510,
        size.height * 0.6327886);
    path_2.cubicTo(
        size.width * 0.009542330,
        size.height * 0.6331307,
        size.width * 0.009363040,
        size.height * 0.6337966,
        size.width * 0.009031610,
        size.height * 0.6345875);
    path_2.cubicTo(
        size.width * 0.008870990,
        size.height * 0.6349534,
        size.width * 0.008459300,
        size.height * 0.6357659,
        size.width * 0.008201420,
        size.height * 0.6362068);
    path_2.cubicTo(
        size.width * 0.007831950,
        size.height * 0.6367693,
        size.width * 0.006858110,
        size.height * 0.6379727,
        size.width * 0.006237440,
        size.height * 0.6385841);
    path_2.cubicTo(
        size.width * 0.005357740,
        size.height * 0.6392955,
        size.width * 0.003193350,
        size.height * 0.6404682,
        size.width * 0.001915450,
        size.height * 0.6408523);
    path_2.cubicTo(
        size.width * 0.0004887550,
        size.height * 0.6410477,
        size.width * -0.002258300,
        size.height * 0.6407659,
        size.width * -0.003528710,
        size.height * 0.6403284);
    path_2.cubicTo(
        size.width * -0.004524430,
        size.height * 0.6398284,
        size.width * -0.006140320,
        size.height * 0.6386625,
        size.width * -0.006771950,
        size.height * 0.6380534);
    path_2.cubicTo(
        size.width * -0.007217110,
        size.height * 0.6375568,
        size.width * -0.007928630,
        size.height * 0.6366148,
        size.width * -0.008205540,
        size.height * 0.6361841);
    path_2.cubicTo(
        size.width * -0.008407180,
        size.height * 0.6358409,
        size.width * -0.008738930,
        size.height * 0.6352102,
        size.width * -0.008873020,
        size.height * 0.6349261);
    path_2.cubicTo(
        size.width * -0.008975750,
        size.height * 0.6346955,
        size.width * -0.009149960,
        size.height * 0.6342682,
        size.width * -0.009222920,
        size.height * 0.6340750);
    path_2.cubicTo(
        size.width * -0.009385510,
        size.height * 0.6336318,
        size.width * -0.009492230,
        size.height * 0.6332614,
        size.width * -0.009554460,
        size.height * 0.6330318);
    path_2.cubicTo(
        size.width * -0.009620640,
        size.height * 0.6327864,
        size.width * -0.009668520,
        size.height * 0.6325784,
        size.width * -0.009700730,
        size.height * 0.6324307);
    path_2.cubicTo(
        size.width * -0.009763460,
        size.height * 0.6321432,
        size.width * -0.009803330,
        size.height * 0.6319102,
        size.width * -0.009824260,
        size.height * 0.6317830);
    path_2.cubicTo(
        size.width * -0.009866200,
        size.height * 0.6315261,
        size.width * -0.009890610,
        size.height * 0.6313261,
        size.width * -0.009899280,
        size.height * 0.6312534);
    path_2.cubicTo(
        size.width * -0.009910490,
        size.height * 0.6311602,
        size.width * -0.009918070,
        size.height * 0.6310875,
        size.width * -0.009921660,
        size.height * 0.6310523);
    path_2.cubicTo(
        size.width * -0.009925650,
        size.height * 0.6310136,
        size.width * -0.009928410,
        size.height * 0.6309841,
        size.width * -0.009929570,
        size.height * 0.6309716);
    path_2.cubicTo(
        size.width * -0.009944440,
        size.height * 0.6308148,
        size.width * -0.009906410,
        size.height * 0.6312364,
        size.width * -0.009883030,
        size.height * 0.6314580);
    path_2.cubicTo(
        size.width * -0.009853600,
        size.height * 0.6317375,
        size.width * -0.009794640,
        size.height * 0.6322557,
        size.width * -0.009687100,
        size.height * 0.6328511);
    path_2.cubicTo(
        size.width * -0.009632500,
        size.height * 0.6331534,
        size.width * -0.009545150,
        size.height * 0.6335909,
        size.width * -0.009409590,
        size.height * 0.6340966);
    path_2.cubicTo(
        size.width * -0.009340160,
        size.height * 0.6343545,
        size.width * -0.009246360,
        size.height * 0.6346750,
        size.width * -0.009121770,
        size.height * 0.6350352);
    path_2.cubicTo(
        size.width * -0.008999770,
        size.height * 0.6353864,
        size.width * -0.008822700,
        size.height * 0.6358500,
        size.width * -0.008573770,
        size.height * 0.6363716);
    path_2.cubicTo(
        size.width * -0.008332310,
        size.height * 0.6368761,
        size.width * -0.007951450,
        size.height * 0.6375864,
        size.width * -0.007385330,
        size.height * 0.6383466);
    path_2.cubicTo(
        size.width * -0.006827790,
        size.height * 0.6390943,
        size.width * -0.005924580,
        size.height * 0.6401148,
        size.width * -0.004596720,
        size.height * 0.6409580);
    path_2.cubicTo(
        size.width * -0.003917800,
        size.height * 0.6413898,
        size.width * -0.003125640,
        size.height * 0.6417761,
        size.width * -0.002226980,
        size.height * 0.6420432);
    path_2.cubicTo(
        size.width * -0.001322060,
        size.height * 0.6423114,
        size.width * -0.0003711640,
        size.height * 0.6424409,
        size.width * 0.0005986960,
        size.height * 0.6424114);
    path_2.cubicTo(
        size.width * 0.002574200,
        size.height * 0.6423489,
        size.width * 0.004205000,
        size.height * 0.6416455,
        size.width * 0.005391200,
        size.height * 0.6408625);
    path_2.cubicTo(
        size.width * 0.006532300,
        size.height * 0.6401091,
        size.width * 0.007328130,
        size.height * 0.6392455,
        size.width * 0.007825640,
        size.height * 0.6386216);
    path_2.cubicTo(
        size.width * 0.008335940,
        size.height * 0.6379818,
        size.width * 0.008700260,
        size.height * 0.6373830,
        size.width * 0.008943400,
        size.height * 0.6369409);
    path_2.cubicTo(
        size.width * 0.009414780,
        size.height * 0.6360864,
        size.width * 0.009708620,
        size.height * 0.6353136,
        size.width * 0.009872080,
        size.height * 0.6348489);
    path_2.cubicTo(
        size.width * 0.01005190,
        size.height * 0.6343375,
        size.width * 0.01018980,
        size.height * 0.6338602,
        size.width * 0.01029430,
        size.height * 0.6334659);
    path_2.cubicTo(
        size.width * 0.01040190,
        size.height * 0.6330591,
        size.width * 0.01049700,
        size.height * 0.6326545,
        size.width * 0.01058190,
        size.height * 0.6322625);
    path_2.lineTo(size.width * -0.008836110, size.height * 0.6268205);
    path_2.cubicTo(
        size.width * -0.008901170,
        size.height * 0.6271205,
        size.width * -0.008868100,
        size.height * 0.6268932,
        size.width * -0.008702510,
        size.height * 0.6264227);
    path_2.cubicTo(
        size.width * -0.008622590,
        size.height * 0.6261943,
        size.width * -0.008406320,
        size.height * 0.6256034,
        size.width * -0.008006970,
        size.height * 0.6248784);
    path_2.cubicTo(
        size.width * -0.007799850,
        size.height * 0.6245023,
        size.width * -0.007470160,
        size.height * 0.6239568,
        size.width * -0.006993160,
        size.height * 0.6233580);
    path_2.cubicTo(
        size.width * -0.006528950,
        size.height * 0.6227761,
        size.width * -0.005765080,
        size.height * 0.6219432,
        size.width * -0.004654670,
        size.height * 0.6212102);
    path_2.cubicTo(
        size.width * -0.003499160,
        size.height * 0.6204477,
        size.width * -0.001897770,
        size.height * 0.6197534,
        size.width * 0.00004954490,
        size.height * 0.6196920);
    path_2.cubicTo(
        size.width * 0.002033540,
        size.height * 0.6196307,
        size.width * 0.003785550,
        size.height * 0.6202455,
        size.width * 0.005164030,
        size.height * 0.6211216);
    path_2.cubicTo(
        size.width * 0.006466100,
        size.height * 0.6219489,
        size.width * 0.007344700,
        size.height * 0.6229443,
        size.width * 0.007878740,
        size.height * 0.6236614);
    path_2.cubicTo(
        size.width * 0.008421370,
        size.height * 0.6243898,
        size.width * 0.008779850,
        size.height * 0.6250614,
        size.width * 0.008999990,
        size.height * 0.6255216);
    path_2.cubicTo(
        size.width * 0.009423810,
        size.height * 0.6264080,
        size.width * 0.009635310,
        size.height * 0.6271489,
        size.width * 0.009720310,
        size.height * 0.6274659);
    path_2.cubicTo(
        size.width * 0.009821340,
        size.height * 0.6278420,
        size.width * 0.009878010,
        size.height * 0.6281352,
        size.width * 0.009905330,
        size.height * 0.6282864);
    path_2.cubicTo(
        size.width * 0.009935160,
        size.height * 0.6284523,
        size.width * 0.009952360,
        size.height * 0.6285739,
        size.width * 0.009960560,
        size.height * 0.6286352);
    path_2.cubicTo(
        size.width * 0.009969310,
        size.height * 0.6287011,
        size.width * 0.009973880,
        size.height * 0.6287443,
        size.width * 0.009975100,
        size.height * 0.6287557);
    path_2.cubicTo(
        size.width * 0.009976440,
        size.height * 0.6287682,
        size.width * 0.009976290,
        size.height * 0.6287682,
        size.width * 0.009973920,
        size.height * 0.6287420);
    path_2.cubicTo(
        size.width * 0.009972560,
        size.height * 0.6287273,
        size.width * 0.009971440,
        size.height * 0.6287148,
        size.width * 0.009968740,
        size.height * 0.6286841);
    path_2.cubicTo(
        size.width * 0.009966950,
        size.height * 0.6286636,
        size.width * 0.009962170,
        size.height * 0.6286102,
        size.width * 0.009956850,
        size.height * 0.6285534);
    path_2.cubicTo(
        size.width * 0.009953490,
        size.height * 0.6285182,
        size.width * 0.009939420,
        size.height * 0.6283670,
        size.width * 0.009917560,
        size.height * 0.6281852);
    path_2.cubicTo(
        size.width * 0.009907580,
        size.height * 0.6281011,
        size.width * 0.009881960,
        size.height * 0.6278920,
        size.width * 0.009838890,
        size.height * 0.6276284);
    path_2.cubicTo(
        size.width * 0.009817400,
        size.height * 0.6274977,
        size.width * 0.009776990,
        size.height * 0.6272625,
        size.width * 0.009713740,
        size.height * 0.6269716);
    path_2.cubicTo(
        size.width * 0.009669470,
        size.height * 0.6267682,
        size.width * 0.009525680,
        size.height * 0.6261148,
        size.width * 0.009234430,
        size.height * 0.6253227);
    path_2.cubicTo(
        size.width * 0.009095070,
        size.height * 0.6249432,
        size.width * 0.008779130,
        size.height * 0.6241318,
        size.width * 0.008216350,
        size.height * 0.6232114);
    path_2.cubicTo(
        size.width * 0.007939320,
        size.height * 0.6227807,
        size.width * 0.007227680,
        size.height * 0.6218375,
        size.width * 0.006782410,
        size.height * 0.6213420);
    path_2.cubicTo(
        size.width * 0.006150670,
        size.height * 0.6207330,
        size.width * 0.004534670,
        size.height * 0.6195659,
        size.width * 0.003538840,
        size.height * 0.6190670);
    path_2.cubicTo(
        size.width * 0.002268320,
        size.height * 0.6186284,
        size.width * -0.0004788450,
        size.height * 0.6183466,
        size.width * -0.001905650,
        size.height * 0.6185432);
    path_2.cubicTo(
        size.width * -0.003183660,
        size.height * 0.6189273,
        size.width * -0.005348150,
        size.height * 0.6200989,
        size.width * -0.006227960,
        size.height * 0.6208114);
    path_2.cubicTo(
        size.width * -0.006848730,
        size.height * 0.6214227,
        size.width * -0.007822680,
        size.height * 0.6226250,
        size.width * -0.008192250,
        size.height * 0.6231886);
    path_2.cubicTo(
        size.width * -0.008450230,
        size.height * 0.6236295,
        size.width * -0.008862020,
        size.height * 0.6244432,
        size.width * -0.009022750,
        size.height * 0.6248091);
    path_2.cubicTo(
        size.width * -0.009354380,
        size.height * 0.6256000,
        size.width * -0.009533860,
        size.height * 0.6262659,
        size.width * -0.009619240,
        size.height * 0.6266091);
    path_2.cubicTo(
        size.width * -0.009715500,
        size.height * 0.6269966,
        size.width * -0.009775960,
        size.height * 0.6273193,
        size.width * -0.009811950,
        size.height * 0.6275295);
    path_2.cubicTo(
        size.width * -0.009882470,
        size.height * 0.6279409,
        size.width * -0.009917800,
        size.height * 0.6282705,
        size.width * -0.009933820,
        size.height * 0.6284330);
    path_2.cubicTo(
        size.width * -0.009967090,
        size.height * 0.6287682,
        size.width * -0.009979740,
        size.height * 0.6290330,
        size.width * -0.009984060,
        size.height * 0.6291273);
    path_2.cubicTo(
        size.width * -0.009989830,
        size.height * 0.6292534,
        size.width * -0.009992760,
        size.height * 0.6293568,
        size.width * -0.009994290,
        size.height * 0.6294182);
    path_2.cubicTo(
        size.width * -0.009999280,
        size.height * 0.6296182,
        size.width * -0.009999580,
        size.height * 0.6298148,
        size.width * -0.009999740,
        size.height * 0.6298784);
    path_2.cubicTo(
        size.width * -0.01000000,
        size.height * 0.6299818,
        size.width * -0.01000000,
        size.height * 0.6301091,
        size.width * -0.01000000,
        size.height * 0.6302409);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.6302409);
    path_2.close();
    path_2.moveTo(size.width * 0.03487020, size.height * 0.5294193);
    path_2.cubicTo(
        size.width * 0.02088600,
        size.height * 0.5596739,
        size.width * 0.01037110,
        size.height * 0.5824227,
        size.width * 0.003245500,
        size.height * 0.5981057);
    path_2.cubicTo(
        size.width * -0.0003140440,
        size.height * 0.6059398,
        size.width * -0.003060520,
        size.height * 0.6120830,
        size.width * -0.004982180,
        size.height * 0.6165489);
    path_2.cubicTo(
        size.width * -0.005940060,
        size.height * 0.6187739,
        size.width * -0.006727920,
        size.height * 0.6206636,
        size.width * -0.007320360,
        size.height * 0.6221784);
    path_2.cubicTo(
        size.width * -0.007795250,
        size.height * 0.6233920,
        size.width * -0.008482710,
        size.height * 0.6251920,
        size.width * -0.008836110,
        size.height * 0.6268205);
    path_2.lineTo(size.width * 0.01058190, size.height * 0.6322625);
    path_2.cubicTo(
        size.width * 0.01044680,
        size.height * 0.6328852,
        size.width * 0.01038750,
        size.height * 0.6328602,
        size.width * 0.01095420,
        size.height * 0.6314125);
    path_2.cubicTo(
        size.width * 0.01140340,
        size.height * 0.6302648,
        size.width * 0.01207060,
        size.height * 0.6286568,
        size.width * 0.01298450,
        size.height * 0.6265330);
    path_2.cubicTo(
        size.width * 0.01480650,
        size.height * 0.6222989,
        size.width * 0.01747080,
        size.height * 0.6163364,
        size.width * 0.02101670,
        size.height * 0.6085318);
    path_2.cubicTo(
        size.width * 0.02810170,
        size.height * 0.5929375,
        size.width * 0.03857560,
        size.height * 0.5702784,
        size.width * 0.05257630,
        size.height * 0.5399886);
    path_2.lineTo(size.width * 0.03487020, size.height * 0.5294193);
    path_2.close();
    path_2.moveTo(size.width * 0.9410970, size.height * 0.5429943);
    path_2.cubicTo(
        size.width * 0.9571300,
        size.height * 0.5713080,
        size.width * 0.9691110,
        size.height * 0.5924670,
        size.width * 0.9772400,
        size.height * 0.6071398);
    path_2.cubicTo(
        size.width * 0.9813090,
        size.height * 0.6144852,
        size.width * 0.9843610,
        size.height * 0.6201136,
        size.width * 0.9864560,
        size.height * 0.6241591);
    path_2.cubicTo(
        size.width * 0.9875070,
        size.height * 0.6261886,
        size.width * 0.9882670,
        size.height * 0.6277250,
        size.width * 0.9887770,
        size.height * 0.6288295);
    path_2.cubicTo(
        size.width * 0.9894060,
        size.height * 0.6301886,
        size.width * 0.9893480,
        size.height * 0.6302443,
        size.width * 0.9891880,
        size.height * 0.6296273);
    path_2.lineTo(size.width * 1.008380, size.height * 0.6232182);
    path_2.cubicTo(
        size.width * 1.007910,
        size.height * 0.6214250,
        size.width * 1.007090,
        size.height * 0.6195670,
        size.width * 1.006480,
        size.height * 0.6182568);
    path_2.cubicTo(
        size.width * 1.005760,
        size.height * 0.6166920,
        size.width * 1.004820,
        size.height * 0.6148034,
        size.width * 1.003690,
        size.height * 0.6126352);
    path_2.cubicTo(
        size.width * 1.001440,
        size.height * 0.6082841,
        size.width * 0.9982580,
        size.height * 0.6024216,
        size.width * 0.9941650,
        size.height * 0.5950330);
    path_2.cubicTo(
        size.width * 0.9859700,
        size.height * 0.5802386,
        size.width * 0.9739220,
        size.height * 0.5589625,
        size.width * 0.9579160,
        size.height * 0.5306966);
    path_2.lineTo(size.width * 0.9410970, size.height * 0.5429943);
    path_2.close();
    path_2.moveTo(size.width * 1.010000, size.height * 0.6363636);
    path_2.cubicTo(
        size.width * 1.010000,
        size.height * 0.6322068,
        size.width * 1.009950,
        size.height * 0.6293023,
        size.width * 1.008380,
        size.height * 0.6232182);
    path_2.lineTo(size.width * 0.9891880, size.height * 0.6296273);
    path_2.cubicTo(
        size.width * 0.9897040,
        size.height * 0.6316216,
        size.width * 0.9898530,
        size.height * 0.6325739,
        size.width * 0.9899170,
        size.height * 0.6331864);
    path_2.cubicTo(
        size.width * 0.9899890,
        size.height * 0.6338727,
        size.width * 0.9900000,
        size.height * 0.6345125,
        size.width * 0.9900000,
        size.height * 0.6363636);
    path_2.lineTo(size.width * 1.010000, size.height * 0.6363636);
    path_2.close();
    path_2.moveTo(size.width * 0.9900000, size.height * 0.3636364);
    path_2.cubicTo(
        size.width * 0.9900000,
        size.height * 0.3654875,
        size.width * 0.9899890,
        size.height * 0.3661273,
        size.width * 0.9899170,
        size.height * 0.3668136);
    path_2.cubicTo(
        size.width * 0.9898530,
        size.height * 0.3674261,
        size.width * 0.9897040,
        size.height * 0.3683784,
        size.width * 0.9891880,
        size.height * 0.3703727);
    path_2.lineTo(size.width * 1.008380, size.height * 0.3767818);
    path_2.cubicTo(
        size.width * 1.009950,
        size.height * 0.3706977,
        size.width * 1.010000,
        size.height * 0.3677932,
        size.width * 1.010000,
        size.height * 0.3636364);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.3636364);
    path_2.close();
    path_2.moveTo(size.width * 0.9579160, size.height * 0.4693034);
    path_2.cubicTo(
        size.width * 0.9739220,
        size.height * 0.4410375,
        size.width * 0.9859700,
        size.height * 0.4197614,
        size.width * 0.9941650,
        size.height * 0.4049670);
    path_2.cubicTo(
        size.width * 0.9982580,
        size.height * 0.3975784,
        size.width * 1.001440,
        size.height * 0.3917159,
        size.width * 1.003690,
        size.height * 0.3873648);
    path_2.cubicTo(
        size.width * 1.004820,
        size.height * 0.3851966,
        size.width * 1.005760,
        size.height * 0.3833080,
        size.width * 1.006480,
        size.height * 0.3817432);
    path_2.cubicTo(
        size.width * 1.007090,
        size.height * 0.3804330,
        size.width * 1.007910,
        size.height * 0.3785750,
        size.width * 1.008380,
        size.height * 0.3767818);
    path_2.lineTo(size.width * 0.9891880, size.height * 0.3703727);
    path_2.cubicTo(
        size.width * 0.9893480,
        size.height * 0.3697557,
        size.width * 0.9894060,
        size.height * 0.3698114,
        size.width * 0.9887770,
        size.height * 0.3711705);
    path_2.cubicTo(
        size.width * 0.9882670,
        size.height * 0.3722750,
        size.width * 0.9875070,
        size.height * 0.3738114,
        size.width * 0.9864560,
        size.height * 0.3758409);
    path_2.cubicTo(
        size.width * 0.9843610,
        size.height * 0.3798864,
        size.width * 0.9813090,
        size.height * 0.3855148,
        size.width * 0.9772400,
        size.height * 0.3928602);
    path_2.cubicTo(
        size.width * 0.9691110,
        size.height * 0.4075330,
        size.width * 0.9571300,
        size.height * 0.4286920,
        size.width * 0.9410970,
        size.height * 0.4570057);
    path_2.lineTo(size.width * 0.9579160, size.height * 0.4693034);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff5465FF).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
