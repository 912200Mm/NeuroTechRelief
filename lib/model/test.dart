import 'dart:ui';
import 'package:flutter/material.dart';

class MessageGroupingWithTimeStamp extends StatefulWidget {
  const MessageGroupingWithTimeStamp({Key? key}) : super(key: key);

  @override
  State<MessageGroupingWithTimeStamp> createState() =>
      _MessageGroupingWithTimeStampState();
}

class _MessageGroupingWithTimeStampState
    extends State<MessageGroupingWithTimeStamp> {
  //message controller
  final messageController = TextEditingController();

  //scroll controller
  ScrollController _scrollController = new ScrollController();

  List<MessageModel> messagesList = [
    //adding data into model for Today date
    MessageModel(
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        message:
            'Hello Today Message and testing long thread for this i hope this will work',
        isMe: true),
    MessageModel(
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        message: 'Hello Today Message',
        isMe: false),
    MessageModel(
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        message: 'Hello Today Message',
        isMe: true),
    MessageModel(
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        message: 'Hello Today Message',
        isMe: false),
    MessageModel(
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        message: 'Hello Today Message',
        isMe: true),
    MessageModel(
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        message: 'Hello Today Message',
        isMe: false),

    //adding data into model for yesterday date

    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 1, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Yesterday Message',
        isMe: false),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 1, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Yesterday Message',
        isMe: true),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 1, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Yesterday Message',
        isMe: false),

    //adding data into model date
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 2, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: true),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 2, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: false),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 2, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: true),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 2, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: false),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 2, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: true),

    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 3, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: false),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 3, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: true),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 3, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: false),
    MessageModel(
        timeStamp: DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 3, 14, 30)
            .microsecondsSinceEpoch,
        message: 'Some Message',
        isMe: true),

    MessageModel(
        timeStamp: DateTime(2023, 02, 08, 15, 20).microsecondsSinceEpoch,
        message: 'Feb 8th Message',
        isMe: true),
    MessageModel(
        timeStamp: DateTime(2023, 02, 08, 15, 20).microsecondsSinceEpoch,
        message: 'Feb 8th Message',
        isMe: false),
    MessageModel(
        timeStamp: DateTime(2023, 02, 08, 15, 20).microsecondsSinceEpoch,
        message: 'Feb 8th Message',
        isMe: true),
    MessageModel(
        timeStamp: DateTime(2023, 01, 20, 15, 20).microsecondsSinceEpoch,
        message: '20 JanMessage',
        isMe: true),
    MessageModel(
        timeStamp: DateTime(2023, 01, 20, 15, 20).microsecondsSinceEpoch,
        message: '20 JanMessage',
        isMe: false),
    MessageModel(
        timeStamp: DateTime(2023, 01, 20, 15, 20).microsecondsSinceEpoch,
        message: '20 JanMessage',
        isMe: true),
    MessageModel(
        timeStamp: DateTime(2023, 01, 20, 15, 20).microsecondsSinceEpoch,
        message: '20 JanMessage',
        isMe: false),
  ];

  // function to convert time stamp to date
  static DateTime returnDateAndTimeFormat(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time.toString()));
    return DateTime(dt.year, dt.month, dt.day);
  }

  //function to return message time in 24 hours format AM/PM

  // function to return date if date changes based on your local date and time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Message Group Time Stamp'),
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(), // ← can't
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          bool isSameDate = false;

                          if (index == 0 && messagesList.length == 1) {
                          } else if (index == messagesList.length - 1) {
                          } else {
                            final DateTime date = returnDateAndTimeFormat(
                                messagesList[index].timeStamp.toString());
                            final DateTime prevDate = returnDateAndTimeFormat(
                                messagesList[index + 1].timeStamp.toString());
                            isSameDate = date.isAtSameMomentAs(prevDate);

                            print("$date $prevDate $isSameDate");
                          }
                          return null;
                        })),
              ),
            ])));
  }
}

// model for messages
class MessageModel {
  int timeStamp;
  String message;
  bool isMe;
  MessageModel(
      {required this.timeStamp, required this.message, required this.isMe});
}

// creating bubble
class MessageBubble extends CustomPainter {
  final Color color;
  final Alignment alignment;
  final bool tail;

  MessageBubble({
    required this.color,
    required this.alignment,
    required this.tail,
  });

  final double _radius = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    if (alignment == Alignment.topRight) {
      if (tail) {
        var path = Path();

        /// starting point
        path.moveTo(_radius * 2, 0);

        /// top-left corner
        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

        /// left line
        path.lineTo(0, h - _radius * 1.5);

        /// bottom-left corner
        path.quadraticBezierTo(0, h, _radius * 2, h);

        /// bottom line
        path.lineTo(w - _radius * 3, h);

        /// bottom-right bubble curve
        path.quadraticBezierTo(
            w - _radius * 1.5, h, w - _radius * 1.5, h - _radius * 0.6);

        /// bottom-right tail curve 1
        path.quadraticBezierTo(w - _radius * 1, h, w, h);

        /// bottom-right tail curve 2
        path.quadraticBezierTo(
            w - _radius * 0.8, h, w - _radius, h - _radius * 1.5);

        /// right line
        path.lineTo(w - _radius, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        var path = Path();

        /// starting point
        path.moveTo(_radius * 2, 0);

        /// top-left corner
        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

        /// left line
        path.lineTo(0, h - _radius * 1.5);

        /// bottom-left corner
        path.quadraticBezierTo(0, h, _radius * 2, h);

        /// bottom line
        path.lineTo(w - _radius * 3, h);

        /// bottom-right curve
        path.quadraticBezierTo(w - _radius, h, w - _radius, h - _radius * 1.5);

        /// right line
        path.lineTo(w - _radius, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    } else {
      if (tail) {
        var path = Path();

        /// starting point
        path.moveTo(_radius * 3, 0);

        /// top-left corner
        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

        /// left line
        path.lineTo(_radius, h - _radius * 1.5);
        // bottom-right tail curve 1
        path.quadraticBezierTo(_radius * .8, h, 0, h);

        /// bottom-right tail curve 2
        path.quadraticBezierTo(
            _radius * 1, h, _radius * 1.5, h - _radius * 0.6);

        /// bottom-left bubble curve
        path.quadraticBezierTo(_radius * 1.5, h, _radius * 3, h);

        /// bottom line
        path.lineTo(w - _radius * 2, h);

        /// bottom-right curve
        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

        /// right line
        path.lineTo(w, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        var path = Path();

        /// starting point
        path.moveTo(_radius * 3, 0);

        /// top-left corner
        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

        /// left line
        path.lineTo(_radius, h - _radius * 1.5);

        /// bottom-left curve
        path.quadraticBezierTo(_radius, h, _radius * 3, h);

        /// bottom line
        path.lineTo(w - _radius * 2, h);

        /// bottom-right curve
        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

        /// right line
        path.lineTo(w, _radius * 1.5);

        /// top-right curve
        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// {@template custom_rect_tween}
/// Linear RectTween with a [Curves.easeOut] curve.
///
/// Less dramatic that the regular [RectTween] used in [Hero] animations.
/// {@endtemplate}
class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    required Rect begin,
    required Rect end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, elasticCurveValue)!,
      lerpDouble(begin!.top, end!.top, elasticCurveValue)!,
      lerpDouble(begin!.right, end!.right, elasticCurveValue)!,
      lerpDouble(begin!.bottom, end!.bottom, elasticCurveValue)!,
    );
  }
}
