# Altmetric Refactoring Exercise

Inside this directory you'll find a Ruby program to format date ranges with
optional start and end times.

You can run its test suite like so:

    $ bundle install
    $ rspec

The main code can be found in lib/date_range_formatter.rb and its behaviour is
defined in spec/date_range_formatter_spec.rb

However, the code is difficult to read and seems to have a bug: when given a
start date of 2009-11-1 and an end date of 2010-11-3, it should format the
date range as "1st November 2009 - 3rd November 2010" but actually returns
"1st - 3rd November 2009".

Find and fix the bug, writing tests if need be and refactor the code as you
see fit.

