String convertDate(String date) {
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

// add comma to amount
String parseTotal(double amount, {bool showCurrency = false}) {
  String currencyTag = '';
  if (showCurrency) {
    currencyTag = '\u00a3 ';
  }
  return currencyTag +
      amount.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}