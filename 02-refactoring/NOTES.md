# Notes

This is my solution to the refactoring exercise for Altmetric.

* The `git` history shows the steps taken during the refactoring.

* I believe the readability of the formatter class has been improved, and the intention is
now much clearer. However, it is still not ideal. Possible next steps would be to separate
the different formatters into their own classes and have the date range formatter use them
as necessary.
