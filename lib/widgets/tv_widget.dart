import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TVWidget extends StatefulWidget {
  TVWidget(
      {Key key,
      @required this.child,
      @required this.focusChange,
      @required this.onclick,
      @required this.decoration,
      @required this.hasDecoration = true,
      @required this.requestFocus = false})
      : super(key: key);

  Widget child;
  onFocusChange focusChange;
  onClick onclick;
  bool requestFocus;
  BoxDecoration decoration;
  bool hasDecoration;

  @override
  State<StatefulWidget> createState() {
    return TVWidgetState();
  }
}

typedef void onFocusChange(bool hasFocus);
typedef void onClick();

class TVWidgetState extends State<TVWidget> {
  FocusNode _focusNode;
  bool init = false;
  var default_decoration = BoxDecoration(
      border: Border.all(width: 3, color: Colors.deepOrange),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ));
  var decoration = null;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (widget.focusChange != null) {
        widget.focusChange(_focusNode.hasFocus);
      }
      if (_focusNode.hasFocus) {
        setState(() {
          if (widget.hasDecoration) {
            decoration = widget.decoration == null
                ? default_decoration
                : widget.decoration;
          }
        });
      } else {
        setState(() {
          decoration = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.requestFocus && !init) {
      FocusScope.of(context).requestFocus(_focusNode);
      init = true;
    }
    return RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (event) {
          if (event is RawKeyDownEvent &&
              event.data is RawKeyEventDataAndroid) {
            RawKeyDownEvent rawKeyDownEvent = event;
            RawKeyEventDataAndroid rawKeyEventDataAndroid =
                rawKeyDownEvent.data;
            print("keyCode: ${rawKeyEventDataAndroid.keyCode}");
            switch (rawKeyEventDataAndroid.keyCode) {
              case 19: //KEY_UP
//                DefaultFocusTraversal.of(context).inDirection(
//                    FocusScope.of(context).focusedChild, TraversalDirection.up);
                FocusScope.of(context)
                    .focusInDirection(TraversalDirection.up);
                break;
              case 20: //KEY_DOWN
                FocusScope.of(context)
                    .focusInDirection(TraversalDirection.down);
                break;
              case 21: //KEY_LEFT
//                            FocusScope.of(context).requestFocus(focusNodeB0);
                FocusScope.of(context)
                    .focusInDirection(TraversalDirection.left);
                // 手动指定下一个焦点
               // FocusScope.of(context).requestFocus(focusNode);
                break;
              case 22: //KEY_RIGHT
//                            FocusScope.of(context).requestFocus(focusNodeB1);
                FocusScope.of(context)
                    .focusInDirection(TraversalDirection.right);
//                DefaultFocusTraversal.of(context)
//                    .inDirection(_focusNode, TraversalDirection.right);
//                if(_focusNode.nextFocus()){
//                  FocusScope.of(context)
//                      .focusInDirection(TraversalDirection.right);
//                }
                break;
              case 23: //KEY_CENTER
                widget.onclick();
                break;
              case 66: //KEY_ENTER
                widget.onclick();
                break;
              default:
                break;
            }
          }
        },
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: decoration,
          child: widget.child,
        ));
  }
}
