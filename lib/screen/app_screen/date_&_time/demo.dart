
/*
TableCalendar(
headerStyle: HeaderStyle(
formatButtonVisible: false,
leftChevronIcon:
SvgPicture.asset("assets/svg/leftArrow.svg"),
rightChevronIcon:
SvgPicture.asset("assets/svg/rightArrow.svg")),
selectedDayPredicate: (day) {
return isSameDay(selectedDay, day);
},
onDaySelected: (selectDay, focusDay) {
if (!isSameDay(selectedDay, selectDay)) {
setState(() {
selectedDay = selectDay;
focusedCurrentDay = focusDay;
});
}
},
onHeaderTapped: (focusedDay) {
print('focusedDay$focusedDay');
},
onFormatChanged: (format) {
if (calendarFormat != format) {
setState(() {
calendarFormat = format;
});
}
},
headerVisible: true,
pageAnimationEnabled: false,
pageJumpingEnabled: true,
daysOfWeekVisible: true,
daysOfWeekStyle: DaysOfWeekStyle(
dowTextFormatter: (date, locale) =>
DateFormat.E(locale).format(date)[0],
weekdayStyle: const TextStyle(
color: Color(0xff5465FF),
fontWeight: FontWeight.bold),
weekendStyle: const TextStyle(
color: Color(0xff5465FF),
fontWeight: FontWeight.bold)),
calendarStyle: const CalendarStyle(
todayDecoration: BoxDecoration(
color: Color(0xff5465FF), shape: BoxShape.circle)),
startingDayOfWeek: StartingDayOfWeek.monday,
rowHeight: 60,
calendarFormat: calendarFormat,
firstDay: DateTime.utc(2010, 10, 16),
lastDay: DateTime.utc(2030, 3, 14),
focusedDay: DateTime.now())*/
