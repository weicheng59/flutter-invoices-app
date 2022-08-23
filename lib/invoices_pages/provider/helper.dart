import 'dart:math';

String convertDate(String date) {
  if (date.length > 10) {
    date = date.substring(0, 10);
  }
  final List<String> dateList = date.split('-');

  // convert month to  month abbreviations
  switch (dateList[1]) {
    case '01':
      dateList[1] = 'Jan';
      break;
    case '02':
      dateList[1] = 'Feb';
      break;
    case '03':
      dateList[1] = 'Mar';
      break;
    case '04':
      dateList[1] = 'Apr';
      break;
    case '05':
      dateList[1] = 'May';
      break;
    case '06':
      dateList[1] = 'Jun';
      break;
    case '07':
      dateList[1] = 'Jul';
      break;
    case '08':
      dateList[1] = 'Aug';
      break;
    case '09':
      dateList[1] = 'Sep';
      break;
    case '10':
      dateList[1] = 'Oct';
      break;
    case '11':
      dateList[1] = 'Nov';
      break;
    case '12':
      dateList[1] = 'Dec';
      break;
  }
  return '${dateList[2]} ${dateList[1]} ${dateList[0]}';
}

const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const _nums = '1234567890';
Random _rnd = Random();

String getRandomString(int length) {
  return String.fromCharCodes(
        Iterable.generate(
          2,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      ) +
      String.fromCharCodes(
        Iterable.generate(
          4,
          (_) => _nums.codeUnitAt(
            _rnd.nextInt(_nums.length),
          ),
        ),
      );
}
