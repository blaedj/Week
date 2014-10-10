
[![Gem Version](https://badge.fury.io/rb/sane_week.svg)](http://badge.fury.io/rb/sane_week)
A simple week utility class for ruby. a week always starts on a monday, and will give you the dates for each day of the week.

```ruby

week = Week.new # not specifying a date defaults to the current date
week.start_date # => Whatever Date.today is

week2 = Week.new(Date.new(2014, 10, 7))
week2.monday   # => #<Date: 2014-10-06 ((2456937j,0s,0n),+0s,2299161j)>
week2.monday.httpdate # => "Mon, 06 Oct 2014 00:00:00 GMT"

```
