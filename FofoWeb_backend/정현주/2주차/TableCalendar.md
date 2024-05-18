## Carousel Calendar / Table Calendar

### Calendar Table : 탁상달력 느낌 <br>

- Support for lists of events and lists of holidays
- Support for switching calendar from week view to two week view to month view (and swiping up and down moves between the three states)
- Scroll between months. But seems to have issues when placed inside a scrolling view (most likely uses a GridView)

✅Event markers <b> : 이벤트 표시<b/><br>
✅Custom day titles (SUN, MON, TUE, WED, THU, FRI, SAT) with Sunday as first day of week <b>: 일요일을 시작으로 지정</b><br>
✅Visible (but grey) dates from the previous and next months <b> : 다음 달 날짜 (1, 2일) 회색 표시 </b> <br>
✅Selected date highlighting and styling <b> : 선택된 날짜 강조 및 스타일 지정 </b> <br>
✅No header OR the option to customize header <b>: 헤더 없음 혹은, 맞춤 설정</b> <br>

Table Calendar was able to achieve the all caps day labels, but still had issues with the nested scrolling.<br>

### Calendar Carousel :캐러셀 캘린더 <br>


✅ Event markers <br>
🆗 Custom day titles (SUN, MON, TUE, WED, THU, FRI, SAT) with Sunday as first day of week: We were able to get very close to the design, all that was different was the all caps style. <br>
✅ Visible (but grey) dates from the previous and next months <br>
✅ Selected date highlighting and styling <br>
✅ No header OR the option to customize header <br>
<br>

<br>

Conclusion<br>
There are lots of calendar options out there for Flutter, and I imagine more will be created as Flutter grows. We eliminated several libraries early on, but they can still provide value.<br>

It was such a close call between Calendar Carousel and Table Calendar that I think we have to call it a draw!<br>
