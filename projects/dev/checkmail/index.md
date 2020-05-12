*The Checkmail application let's you check your remote email account status, from the command line, to see if you have new messages.*

Checkmail uses the pop protocol to query your email account and display, the date, the sender and the subject of any new email receive since your last query.

# Screenshots
    rodrigo@hodja% checkmail -r mypopaccount
    Checkmail by rodrigo osorio
     (c) May 28 2008
    =======================
    recuperation des messages.... 
    -----------------------------------------------------
    M01 : Date: Thu, 29 May 2008 22:39:53 +0200
    M01 : From: "Pierre lagent" <pierre@agence-imo.com>
    M01 : Subject: Appartement a vendre super affaire
    bye!

# Usage

`checkmail [-r] [<account_name>]`

 * -r : reset the application state and display the full content of the inbox and not only the last incoming messages "account_name" is the pop account name file located in the ~/.checkmail directory

# Configuration Files

In your home create a .checkmail directory and set its permission to 700 to protect it.

In This directory you can create one file per pop account.

The account files has the “.act” extension. The file syntax the username followed by the mail server as displayed below.

    % ls ~/.checkmail
    mypopaccount.act

    % cat ~/.checkmail/mypopaccount.acc
    rodrigo pop.mailserver.com

The account password is requested at every connection, for debugging purpose a single password can be stored in a 'pass' file located in the accounts directory. This password will be used for any account.

# Download

[checkmail.c](http://files.bebik.net/code/checkmail.c): Download the source code

# License

The code is delivered under [BSD License](https://en.wikipedia.org/wiki/BSD_licenses)
