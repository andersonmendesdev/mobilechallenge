import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget(
      {Key? key,
      required this.controller,
      required this.focusNode,
      required this.onSubmitted,
      required this.onClear})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String query) onSubmitted;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Buscar usuário',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  onPressed: onClear, icon: const Icon(Icons.cancel, size: 18))
              : null,
        ),
      ),
    );
  }
}
