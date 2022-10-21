import 'package:flutter/material.dart';

class ModalRemoveItem extends StatelessWidget {
  final String name;
  final String label;

  const ModalRemoveItem({Key? key,
    required this.name,
    required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Remover',
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 17)),
          const SizedBox(height: 15),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: const TextStyle(color: Colors.black54, fontSize: 16),
                children: <TextSpan>[
                  TextSpan(text: 'Deseja remover $label '),
                  TextSpan(
                      text: '$name?',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black87))
                ]),
          ),
          Container(
            height: 60.0,
            padding: const EdgeInsets.only(
                left: 5.0, right: 5.0, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    child: const Text('Não',
                        style: TextStyle(color: Colors.black54)),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: MaterialButton(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme
                                .of(context)
                                .primaryColor, width: 1.5)),
                    child: const Text('Sim',
                        style: TextStyle(color: Colors.black54)),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ModalArchiveItem extends StatelessWidget {
  final String name;
  final String label;

  const ModalArchiveItem({Key? key,
    required this.name,
    required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Arquivar',
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 17)),
          const SizedBox(height: 15),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: const TextStyle(color: Colors.black54, fontSize: 16),
                children: <TextSpan>[
                  TextSpan(text: 'Deseja $label '),
                  TextSpan(
                      text: '$name?',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black87))
                ]),
          ),
          Container(
            height: 60.0,
            padding: const EdgeInsets.only(
                left: 5.0, right: 5.0, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    child: const Text('Não',
                        style: TextStyle(color: Colors.black54)),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: MaterialButton(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme
                                .of(context)
                                .primaryColor, width: 1.5)),
                    child: const Text('Sim',
                        style: TextStyle(color: Colors.black54)),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}