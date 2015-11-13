# Altmetric Programming Exercise

In the resources directory, you'll find three data files:

* journals.csv: a list of journal titles and ISSNs;
* articles.csv: a list of article DOIs [0], titles and ISSNs;
* authors.json: a list of author names and their article DOIs.

We want to combine these data and output a single text file in one of two
different formats:

* CSV with columns of DOI, Article title, Author name, Journal title and
  Journal ISSN, e.g.

      10.1234/altmetric0,Small Wooden Chair,Amari Lubowitz,"Shanahan, Green and Ziemann",1337-8688

* JSON as an array of objects with fields for DOI, title, author, journal and
  ISSN, e.g.

    {
        "doi": "10.1234/altmetric0",
        "title": "Small Wooden Chair",
        "author": "Amari Lubowitz",
        "journal": "Shanahan, Green and Ziemann",
        "issn": "1337-8688"
    }

Note that ISSNs should always be formatted as two groups of four digits
separated by a hyphen, e.g. 1234-5678, but might be missing the hyphen in the
source data.

We'd like you to create a Ruby program that can take these three files and
produce the new formats by running it like so (assuming the program is called
combine.rb):

    $ ruby combine.rb --format json journals.csv articles.csv authors.json > full_articles.json
    $ ruby combine.rb --format csv journals.csv articles.csv authors.json > full_articles.csv

    [0]: http://en.wikipedia.org/wiki/Digital_object_identifier
