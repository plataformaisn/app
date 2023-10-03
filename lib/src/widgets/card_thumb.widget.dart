import 'package:flutter/material.dart';

class CardThumbWidget<T> extends StatelessWidget {
  final bool isNew;
  final String title;
  final Widget subTitle;
  final Widget? headerIcons;
  final String? backgroundImage;
  final bool isCustomTitle;
  final Widget? customTitle;

  const CardThumbWidget(
      {super.key,
      required this.isNew,
      required this.title,
      required this.subTitle,
      this.isCustomTitle = false,
      this.customTitle,
      this.headerIcons,
      this.backgroundImage});

  renderTitle() {
    if (!isCustomTitle) {
      return Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Align(alignment: Alignment.center, child: customTitle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 289,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage('$backgroundImage'),
          fit: BoxFit.contain,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 67, bottom: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerIcons ?? const SizedBox(),
            renderTitle(),
            if (isNew)
              const SizedBox(
                height: 25,
              ),
            if (isNew)
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  alignment: Alignment.center,
                  height: 32,
                  width: 86,
                  decoration: const BoxDecoration(
                      color: Color(0xffF2A74B),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: const Text(
                    'Novo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            const SizedBox(
              height: 32,
            ),
            Flexible(
                child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff782749)),
                color: const Color(0xffF1D0BD),
                borderRadius: BorderRadius.circular(8),
              ),
              //@TODO : AJUSTAR PADDING PARA LEFT:8 RIGHT:8 ASSIM QUE ADICIONAR A FONTE CORRETA
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 3, right: 8, left: 8, bottom: 3),
                  child: subTitle),
            ))
          ],
        ),
      ),
    );
  }
}
