# [MySQL] pDate
  

Content:
* [About](https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#about)
* [Requirements](https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#requirements)
* [Download](https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#download)
* [Installation](https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#installation)
* [Usage](https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#usage)
* [License](https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#license)
* [Issues/Feedbacks](https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#https://github.com/Mehdi-Hp/Presian-Date-for-MySQL#issuesfeedbacks)


## About

[MySQL] pDate is a Gregorian / Jalali date converter functions for MySQL.

## Requirements

* MySQL 5+

## Download

* zip: https://github.com/zoghal/Presian-Date-for-MySQL/zipball/master
* tgz: https://github.com/zoghal/Presian-Date-for-MySQL/tarball/master
* git http: `git clone http: https://github.com/zoghal/Presian-Date-for-MySQL.git`
* git: `git clone git://github.com/zoghal/Presian-Date-for-MySQL.git`

## Installation

Import __pDate.sql__ in your database.

## Usage

You can use these six functions, which are provided on a set:

#### PDATE(datetime)
Takes georgian datetime as input and returns jalali date in text format.

#### PMONTH(datetime)
Takes georgian datetime as input and returns jalali month number in text format.

#### PMONTHNAME(datetime)
Takes georgian datetime as input and returns jalali month name in text format.

#### PYEAR(datetime)
Takes georgian datetime as input and returns jalali year number in text format.

#### PDAY(datetime)
Takes georgian datetime as input and returns jalali day number in text format.

#### GDATE(year smallint, month smallint, day smallint)
Takes jalali date in "year/month/day" format as input and returns georgian date in datetime format.

#### GDATESTR(jdate char(10))
Takes jalali date in string format (e.g: `'1390/3/3'` or `'1390/03/3'` or `'1390/3/03` or `'1390/03/03' `) as input and returns georgian date in datetime format.

_You can not enter Jalali year in short format! for example `'90/03/03'` shows the 90th Jalali year, not 1390!_

---

Here is simple line of sql code which you can use it to test the set of functions:

```
SELECT	pdate(NOW()),
		pyear('2009-09-22'),
        pmonth('2009-09-22'),
        pmonthname(NOW()),
        gdate(1366,9,19),
        gdatestr('1366/9/19');
```
 
  
## License

GNU General Public License. [http://www.gnu.org/licenses/gpl.txt](http://www.gnu.org/licenses/gpl.txt)

## Issues/Feedbacks

https://github.com/zoghal/Presian-Date-for-MySQL/issues