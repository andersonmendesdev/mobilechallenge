import 'package:flutter/material.dart';

class ModalLogout extends StatelessWidget {
  const ModalLogout(
      {Key? key,
      this.title = 'Sair',
      this.message = 'Tem certeza que deseja sair?'})
      : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 17)),
          const SizedBox(height: 15),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, fontSize: 16),
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
                    child: const Text('Não'),
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
                            color: Theme.of(context).primaryColor, width: 1.5)),
                    child: const Text('Sim'),
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
