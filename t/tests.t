use Test::More qw[no_plan];
# $Id: tests.t,v 1.1 2004/05/27 03:11:42 cwest Exp $
use strict;

use_ok 'Email::Address';

my @list = (
          [
            '',
            []
          ],
          [
            '"\'\'\'advocacy@perl.org \' \' \'" <advocacy@perl.org>',
            [
              [
                '"\'\'\'advocacy@perl.org \' \' \'"',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'\'advocacy@perl.org \' \'" <advocacy@perl.org>',
            [
              [
                '"\'\'advocacy@perl.org \' \'"',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'. Jerry a\'" <JerryPanshen@aol.com>',
            [
              [
                '"\'. Jerry a\'"',
                'JerryPanshen@aol.com',
                undef
              ]
            ]
          ],
          [
            '"\'Adam Turoff\'" <adam.turoff@isinet.com>, advocacy@perl.org',
            [
              [
                '"\'Adam Turoff\'"',
                'adam.turoff@isinet.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Andy Lester\'" <andy@petdance.com>, "\'Gabor Szabo\'" <gabor@tracert.com>, advocacy@perl.org',
            [
              [
                '"\'Andy Lester\'"',
                'andy@petdance.com',
                undef
              ],
              [
                '"\'Gabor Szabo\'"',
                'gabor@tracert.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Ask Bjoern Hansen\'" <ask@perl.org>, <advocacy@perl.org>',
            [
              [
                '"\'Ask Bjoern Hansen\'"',
                'ask@perl.org',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Chris Nandor\'" <pudge@pobox.com> , "\'David E. Wheeler\'" <David@wheeler.net>',
            [
              [
                '"\'Chris Nandor\'"',
                'pudge@pobox.com',
                undef
              ],
              [
                '"\'David E. Wheeler\'"',
                'David@wheeler.net',
                undef
              ]
            ]
          ],
          [
            '"\'Chris Nandor\'" <pudge@pobox.com> , "\'Elaine -HFB- Ashton\'" <elaine@chaos.wustl.edu>',
            [
              [
                '"\'Chris Nandor\'"',
                'pudge@pobox.com',
                undef
              ],
              [
                '"\'Elaine -HFB- Ashton\'"',
                'elaine@chaos.wustl.edu',
                undef
              ]
            ]
          ],
          [
            '"\'Chris Nandor\'" <pudge@pobox.com> , "\'Jon Orwant\'" <orwant@media.mit.edu>, <chip@valinux.com> , <tidbit@sri.net>, <advocacy@perl.org>',
            [
              [
                '"\'Chris Nandor\'"',
                'pudge@pobox.com',
                undef
              ],
              [
                '"\'Jon Orwant\'"',
                'orwant@media.mit.edu',
                undef
              ],
              [
                undef,
                'chip@valinux.com',
                undef
              ],
              [
                undef,
                'tidbit@sri.net',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Chris Nandor\'" <pudge@pobox.com>, <advocacy@perl.org>, <perl5-porters@perl.org>',
            [
              [
                '"\'Chris Nandor\'"',
                'pudge@pobox.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'perl5-porters@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Chris Nandor\'" <pudge@pobox.com>, advocacy@perl.org',
            [
              [
                '"\'Chris Nandor\'"',
                'pudge@pobox.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Chris Nandor\'" <pudge@pobox.com>, advocacy@perl.org, perl5-porters@perl.org',
            [
              [
                '"\'Chris Nandor\'"',
                'pudge@pobox.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'perl5-porters@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'David H. Adler \'" <dha@panix.com>, "\'advocacy@perl.org \'" <advocacy@perl.org>',
            [
              [
                '"\'David H. Adler \'"',
                'dha@panix.com',
                undef
              ],
              [
                '"\'advocacy@perl.org \'"',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Doucette, Bob\'" <BDoucette@tesent.com>, \'Rich Bowen\' <rbowen@rcbowen.com>',
            [
              [
                '"\'Doucette, Bob\'"',
                'BDoucette@tesent.com',
                undef
              ],
              [
                '\'Rich Bowen\'',
                'rbowen@rcbowen.com',
                undef
              ]
            ]
          ],
          [
            '"\'Elaine -HFB- Ashton \'" <elaine@chaos.wustl.edu>, "Turoff, Adam" <adam.turoff@isinet.com>',
            [
              [
                '"\'Elaine -HFB- Ashton \'"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"Turoff, Adam"',
                'adam.turoff@isinet.com',
                undef
              ]
            ]
          ],
          [
            '"\'Elaine -HFB- Ashton\'" <elaine@chaos.wustl.edu>',
            [
              [
                '"\'Elaine -HFB- Ashton\'"',
                'elaine@chaos.wustl.edu',
                undef
              ]
            ]
          ],
          [
            '"\'Elaine -HFB- Ashton\'" <elaine@chaos.wustl.edu> , "\'Larry Wall\'" <larry@wall.org>',
            [
              [
                '"\'Elaine -HFB- Ashton\'"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"\'Larry Wall\'"',
                'larry@wall.org',
                undef
              ]
            ]
          ],
          [
            '"\'Elaine -HFB- Ashton\'" <elaine@chaos.wustl.edu> , "\'Larry Wall\'" <larry@wall.org> , "\'Jon Orwant\'" <orwant@media.mit.edu>, <chip@valinux.com> , <tidbit@sri.net>, <advocacy@perl.org>',
            [
              [
                '"\'Elaine -HFB- Ashton\'"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"\'Larry Wall\'"',
                'larry@wall.org',
                undef
              ],
              [
                '"\'Jon Orwant\'"',
                'orwant@media.mit.edu',
                undef
              ],
              [
                undef,
                'chip@valinux.com',
                undef
              ],
              [
                undef,
                'tidbit@sri.net',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Elaine -HFB- Ashton\'" <elaine@chaos.wustl.edu>, "\'Larry Wall\'" <larry@wall.org>, "\'Jon Orwant\'" <orwant@media.mit.edu>, <chip@valinux.com>, <tidbit@sri.net>, <advocacy@perl.org>',
            [
              [
                '"\'Elaine -HFB- Ashton\'"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"\'Larry Wall\'"',
                'larry@wall.org',
                undef
              ],
              [
                '"\'Jon Orwant\'"',
                'orwant@media.mit.edu',
                undef
              ],
              [
                undef,
                'chip@valinux.com',
                undef
              ],
              [
                undef,
                'tidbit@sri.net',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Elaine -HFB- Ashton\'" <elaine@chaos.wustl.edu>, <advocacy@perl.org>',
            [
              [
                '"\'Elaine -HFB- Ashton\'"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'John Porter\'" <jdporter@min.net>, "\'advocacy@perl.org\'" <advocacy@perl.org>',
            [
              [
                '"\'John Porter\'"',
                'jdporter@min.net',
                undef
              ],
              [
                '"\'advocacy@perl.org\'"',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Larry Wall\'" <larry@wall.org> , "\'Jon Orwant\'" <orwant@media.mit.edu>, <chip@valinux.com> , <tidbit@sri.net>, <advocacy@perl.org>',
            [
              [
                '"\'Larry Wall\'"',
                'larry@wall.org',
                undef
              ],
              [
                '"\'Jon Orwant\'"',
                'orwant@media.mit.edu',
                undef
              ],
              [
                undef,
                'chip@valinux.com',
                undef
              ],
              [
                undef,
                'tidbit@sri.net',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Madeline Schnapp \'" <madeline@oreilly.com>, "\'advocacy@perl.org \'" <advocacy@perl.org>',
            [
              [
                '"\'Madeline Schnapp \'"',
                'madeline@oreilly.com',
                undef
              ],
              [
                '"\'advocacy@perl.org \'"',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Mark Mielke\'" <markm@nortelnetworks.com>',
            [
              [
                '"\'Mark Mielke\'"',
                'markm@nortelnetworks.com',
                undef
              ]
            ]
          ],
          [
            '"\'Pamela Carter\'" <pcarter150@comcast.net>, <advocacy@perl.org>',
            [
              [
                '"\'Pamela Carter\'"',
                'pcarter150@comcast.net',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Shlomi Fish\'" <shlomif@vipe.technion.ac.il>',
            [
              [
                '"\'Shlomi Fish\'"',
                'shlomif@vipe.technion.ac.il',
                undef
              ]
            ]
          ],
          [
            '"\'Steve Lane\'" <sml@zfx.com>, "\'Chris Nandor\'" <pudge@pobox.com>, advocacy@perl.org, perl5-porters@perl.org',
            [
              [
                '"\'Steve Lane\'"',
                'sml@zfx.com',
                undef
              ],
              [
                '"\'Chris Nandor\'"',
                'pudge@pobox.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'perl5-porters@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'Tom Christiansen\'" <tchrist@chthon.perl.com>, Horsley Tom <Tom.Horsley@ccur.com>, "\'Steve Lane\'" <sml@zfx.com>, advocacy@perl.org, perl5-porters@perl.org',
            [
              [
                '"\'Tom Christiansen\'"',
                'tchrist@chthon.perl.com',
                undef
              ],
              [
                'Horsley Tom',
                'Tom.Horsley@ccur.com',
                undef
              ],
              [
                '"\'Steve Lane\'"',
                'sml@zfx.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'perl5-porters@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'abigail@foad.org\'" <abigail@foad.org>,	 "Michael R. Wolf"<MichaelRunningWolf@att.net>',
            [
              [
                '"\'abigail@foad.org\'"',
                'abigail@foad.org',
                undef
              ],
              [
                '"Michael R. Wolf"',
                'MichaelRunningWolf@att.net',
                undef
              ]
            ]
          ],
          [
            '"\'abigail@foad.org\'" <abigail@foad.org>, Michael G Schwern <schwern@pobox.com>',
            [
              [
                '"\'abigail@foad.org\'"',
                'abigail@foad.org',
                undef
              ],
              [
                'Michael G Schwern',
                'schwern@pobox.com',
                undef
              ]
            ]
          ],
          [
            '"\'abigail@foad.org\'" <abigail@foad.org>, Michael G Schwern <schwern@pobox.com>, Nicholas Clark <nick@ccl4.org>, Piers Cawley <pdcawley@bofh.org.uk>, advocacy@perl.org',
            [
              [
                '"\'abigail@foad.org\'"',
                'abigail@foad.org',
                undef
              ],
              [
                'Michael G Schwern',
                'schwern@pobox.com',
                undef
              ],
              [
                'Nicholas Clark',
                'nick@ccl4.org',
                undef
              ],
              [
                'Piers Cawley',
                'pdcawley@bofh.org.uk',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'advocacy@perl.org \'" <advocacy@perl.org>',
            [
              [
                '"\'advocacy@perl.org \'"',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'advocacy@perl.org \'" <advocacy@perl.org>, "Turoff, Adam" <adam.turoff@isinet.com>',
            [
              [
                '"\'advocacy@perl.org \'"',
                'advocacy@perl.org',
                undef
              ],
              [
                '"Turoff, Adam"',
                'adam.turoff@isinet.com',
                undef
              ]
            ]
          ],
          [
            '"\'advocacy@perl.org\'" <advocacy@perl.org>',
            [
              [
                '"\'advocacy@perl.org\'"',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'bwarnock@capita.com\'" <bwarnock@capita.com>, advocacy@perl.org',
            [
              [
                '"\'bwarnock@capita.com\'"',
                'bwarnock@capita.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"\'duff@pobox.com\'" <duff@pobox.com>',
            [
              [
                '"\'duff@pobox.com\'"',
                'duff@pobox.com',
                undef
              ]
            ]
          ],
          [
            '"\'london-list@happyfunball.pm.org\'" <london-list@happyfunball.pm.org>',
            [
              [
                '"\'london-list@happyfunball.pm.org\'"',
                'london-list@happyfunball.pm.org',
                undef
              ]
            ]
          ],
          [
            '"\'perl-hackers@stlouis.pm.org\'" <perl-hackers@stlouis.pm.org>',
            [
              [
                '"\'perl-hackers@stlouis.pm.org\'"',
                'perl-hackers@stlouis.pm.org',
                undef
              ]
            ]
          ],
          [
            '"\'perl-hackers@stlouis.pm.org\'" <perl-hackers@stlouis.pm.org>, advocacy@perl.org, marsneedswomen@happyfunball.pm.org',
            [
              [
                '"\'perl-hackers@stlouis.pm.org\'"',
                'perl-hackers@stlouis.pm.org',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'marsneedswomen@happyfunball.pm.org',
                undef
              ]
            ]
          ],
          [
            '"<advocacy@perl.org>" <advocacy@perl.org>',
            [
              [
                'advocacy',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Adam Turoff" <adam.turoff@isinet.com>, "Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>',
            [
              [
                '"Adam Turoff"',
                'adam.turoff@isinet.com',
                undef
              ],
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ]
            ]
          ],
          [
            '"Adam Turoff" <adam.turoff@isinet.com>, "Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>, "Brent Michalski" <brent@perlguy.net>, "Madeline Schnapp" <madeline@oreilly.com>, <advocacy@perl.org>, <betsy@oreilly.com>',
            [
              [
                '"Adam Turoff"',
                'adam.turoff@isinet.com',
                undef
              ],
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"Brent Michalski"',
                'brent@perlguy.net',
                undef
              ],
              [
                '"Madeline Schnapp"',
                'madeline@oreilly.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'betsy@oreilly.com',
                undef
              ]
            ]
          ],
          [
            '"Adam Turoff" <adam.turoff@isinet.com>, "Paul Prescod" <paul@prescod.net>',
            [
              [
                '"Adam Turoff"',
                'adam.turoff@isinet.com',
                undef
              ],
              [
                '"Paul Prescod"',
                'paul@prescod.net',
                undef
              ]
            ]
          ],
          [
            '"Alan Olsen" <alan@clueserver.org>, "Rich Bowen" <rbowen@rcbowen.com>',
            [
              [
                '"Alan Olsen"',
                'alan@clueserver.org',
                undef
              ],
              [
                '"Rich Bowen"',
                'rbowen@rcbowen.com',
                undef
              ]
            ]
          ],
          [
            '"Andreas J. Koenig" <andreas.koenig@anima.de>',
            [
              [
                '"Andreas J. Koenig"',
                'andreas.koenig@anima.de',
                undef
              ]
            ]
          ],
          [
            '"Andreas J. Koenig" <andreas.koenig@anima.de>, advocacy@perl.org',
            [
              [
                '"Andreas J. Koenig"',
                'andreas.koenig@anima.de',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Andreas J. Koenig" <andreas.koenig@anima.de>, advocacy@perl.org, regn@ActiveState.com',
            [
              [
                '"Andreas J. Koenig"',
                'andreas.koenig@anima.de',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'regn@ActiveState.com',
                undef
              ]
            ]
          ],
          [
            '"Andy Wardley" <abw@cre.canon.co.uk>',
            [
              [
                '"Andy Wardley"',
                'abw@cre.canon.co.uk',
                undef
              ]
            ]
          ],
          [
            '"Bas A. Schulte" <bschulte@zeelandnet.nl>',
            [
              [
                '"Bas A. Schulte"',
                'bschulte@zeelandnet.nl',
                undef
              ]
            ]
          ],
          [
            '"Bas A.Schulte" <bschulte@zeelandnet.nl>',
            [
              [
                '"Bas A.Schulte"',
                'bschulte@zeelandnet.nl',
                undef
              ]
            ]
          ],
          [
            '"Betsy Waliszewski" <betsy@oreilly.com>, "perl-advocacy" <advocacy@perl.org>',
            [
              [
                '"Betsy Waliszewski"',
                'betsy@oreilly.com',
                undef
              ],
              [
                '"perl-advocacy"',
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Bradley M. Kuhn" <bkuhn@ebb.org>',
            [
              [
                '"Bradley M. Kuhn"',
                'bkuhn@ebb.org',
                undef
              ]
            ]
          ],
          [
            '"Brammer, Phil" <PBRA01@CONAGRAFROZEN.COM>',
            [
              [
                '"Brammer, Phil"',
                'PBRA01@CONAGRAFROZEN.COM',
                undef
              ]
            ]
          ],
          [
            '"Brent Michalski" <brent@perlguy.net>, "Madeline Schnapp" <madeline@oreilly.com>, <advocacy@perl.org>, <betsy@oreilly.com>',
            [
              [
                '"Brent Michalski"',
                'brent@perlguy.net',
                undef
              ],
              [
                '"Madeline Schnapp"',
                'madeline@oreilly.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'betsy@oreilly.com',
                undef
              ]
            ]
          ],
          [
            '"Brian Wilson" <bwilson@songline.com>',
            [
              [
                '"Brian Wilson"',
                'bwilson@songline.com',
                undef
              ]
            ]
          ],
          [
            '"Calvin Lee" <bodyshock911@hotmail.com>, <advocacy@perl.org>',
            [
              [
                '"Calvin Lee"',
                'bodyshock911@hotmail.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Calvin Lee" <bodyshock911@hotmail.com>, advocacy@perl.org',
            [
              [
                '"Calvin Lee"',
                'bodyshock911@hotmail.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Chip Salzenberg" <chip@valinux.com>',
            [
              [
                '"Chip Salzenberg"',
                'chip@valinux.com',
                undef
              ]
            ]
          ],
          [
            '"Chip Salzenberg" <chip@valinux.com>, "Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>',
            [
              [
                '"Chip Salzenberg"',
                'chip@valinux.com',
                undef
              ],
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ]
            ]
          ],
          [
            '"Chris Devers" <cdevers@boston.com>, "Uri Guttman" <uri@stemsystems.com>',
            [
              [
                '"Chris Devers"',
                'cdevers@boston.com',
                undef
              ],
              [
                '"Uri Guttman"',
                'uri@stemsystems.com',
                undef
              ]
            ]
          ],
          [
            '"Chris Nandor" <pudge@pobox.com>',
            [
              [
                '"Chris Nandor"',
                'pudge@pobox.com',
                undef
              ]
            ]
          ],
          [
            '"Chris Nandor" <pudge@pobox.com>, "Nathan Torkington" <gnat@frii.com>, "Peter Scott" <Peter@PSDT.com>',
            [
              [
                '"Chris Nandor"',
                'pudge@pobox.com',
                undef
              ],
              [
                '"Nathan Torkington"',
                'gnat@frii.com',
                undef
              ],
              [
                '"Peter Scott"',
                'Peter@PSDT.com',
                undef
              ]
            ]
          ],
          [
            '"Chris Nandor" <pudge@pobox.com>, "Nathan Torkington" <gnat@frii.com>, <advocacy@perl.org>, "Peter Scott" <Peter@PSDT.com>',
            [
              [
                '"Chris Nandor"',
                'pudge@pobox.com',
                undef
              ],
              [
                '"Nathan Torkington"',
                'gnat@frii.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                '"Peter Scott"',
                'Peter@PSDT.com',
                undef
              ]
            ]
          ],
          [
            '"Clinton A. Pierce" <clintp@geeksalad.org>',
            [
              [
                '"Clinton A. Pierce"',
                'clintp@geeksalad.org',
                undef
              ]
            ]
          ],
          [
            '"Clinton A. Pierce" <clintp@geeksalad.org>, madeline@oreilly.com, pudge@pobox.com, advocacy@perl.org',
            [
              [
                '"Clinton A. Pierce"',
                'clintp@geeksalad.org',
                undef
              ],
              [
                undef,
                'madeline@oreilly.com',
                undef
              ],
              [
                undef,
                'pudge@pobox.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Curtis Poe" <cp@onsitetech.com>, <advocacy@perl.org>',
            [
              [
                '"Curtis Poe"',
                'cp@onsitetech.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Curtis Poe" <cp@onsitetech.com>, advocacy@perl.org',
            [
              [
                '"Curtis Poe"',
                'cp@onsitetech.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Dave Cross" <dave@dave.org.uk>',
            [
              [
                '"Dave Cross"',
                'dave@dave.org.uk',
                undef
              ]
            ]
          ],
          [
            '"David E. Wheeler" <David@Wheeler.net>',
            [
              [
                '"David E. Wheeler"',
                'David@Wheeler.net',
                undef
              ]
            ]
          ],
          [
            '"David E. Wheeler" <David@Wheeler.net>, "\'Larry Wall\'" <larry@wall.org>, "\'Jon Orwant\'" <orwant@media.mit.edu>, chip@valinux.com, tidbit@sri.net, advocacy@perl.org',
            [
              [
                '"David E. Wheeler"',
                'David@Wheeler.net',
                undef
              ],
              [
                '"\'Larry Wall\'"',
                'larry@wall.org',
                undef
              ],
              [
                '"\'Jon Orwant\'"',
                'orwant@media.mit.edu',
                undef
              ],
              [
                undef,
                'chip@valinux.com',
                undef
              ],
              [
                undef,
                'tidbit@sri.net',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"David E. Wheeler" <David@Wheeler.net>, \'Elaine -HFB- Ashton\' <elaine@chaos.wustl.edu>, \'Larry Wall\' <larry@wall.org>, \'Jon Orwant\' <orwant@media.mit.edu>, tidbit@sri.net, advocacy@perl.org',
            [
              [
                '"David E. Wheeler"',
                'David@Wheeler.net',
                undef
              ],
              [
                '\'Elaine -HFB- Ashton\'',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '\'Larry Wall\'',
                'larry@wall.org',
                undef
              ],
              [
                '\'Jon Orwant\'',
                'orwant@media.mit.edu',
                undef
              ],
              [
                undef,
                'tidbit@sri.net',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"David Grove" <pete@petes-place.com>',
            [
              [
                '"David Grove"',
                'pete@petes-place.com',
                undef
              ]
            ]
          ],
          [
            '"David Grove" <pete@petes-place.com>, <advocacy@perl.org>',
            [
              [
                '"David Grove"',
                'pete@petes-place.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"David H. Adler" <dha@panix.com>',
            [
              [
                '"David H. Adler"',
                'dha@panix.com',
                undef
              ]
            ]
          ],
          [
            '"David H. Adler" <dha@panix.com>, <advocacy@perl.org>, <simon@brecon.co.uk>',
            [
              [
                '"David H. Adler"',
                'dha@panix.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'simon@brecon.co.uk',
                undef
              ]
            ]
          ],
          [
            '"David H. Adler" <dha@panix.com>, advocacy@perl.org',
            [
              [
                '"David H. Adler"',
                'dha@panix.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"David H. Adler" <dha@panix.com>, advocacy@perl.org, perl5-porters@perl.org',
            [
              [
                '"David H. Adler"',
                'dha@panix.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ],
              [
                undef,
                'perl5-porters@perl.org',
                undef
              ]
            ]
          ],
          [
            '"David H. Adler" <dha@panix.com>,advocacy@perl.org',
            [
              [
                '"David H. Adler"',
                'dha@panix.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Edwards, Darryl" <Darryl.Edwards@adc.com>',
            [
              [
                '"Edwards, Darryl"',
                'Darryl.Edwards@adc.com',
                undef
              ]
            ]
          ],
          [
            '"Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>',
            [
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ]
            ]
          ],
          [
            '"Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>, "Brent Michalski" <brent@perlguy.net>',
            [
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"Brent Michalski"',
                'brent@perlguy.net',
                undef
              ]
            ]
          ],
          [
            '"Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>, "Frank Schmuck, CFO" <fschmuck@lcch.org>',
            [
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"Frank Schmuck, CFO"',
                'fschmuck@lcch.org',
                undef
              ]
            ]
          ],
          [
            '"Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>, "Peter Scott" <Peter@PSDT.com>',
            [
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"Peter Scott"',
                'Peter@PSDT.com',
                undef
              ]
            ]
          ],
          [
            '"Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>, "Tom Christiansen" <tchrist@chthon.perl.com>, <Ben_Tilly@trepp.com>, "David H. Adler" <dha@panix.com>, <advocacy@perl.org>',
            [
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"Tom Christiansen"',
                'tchrist@chthon.perl.com',
                undef
              ],
              [
                undef,
                'Ben_Tilly@trepp.com',
                undef
              ],
              [
                '"David H. Adler"',
                'dha@panix.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>, "brian d foy" <tidbit@sri.net>, <advocacy@perl.org>',
            [
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                '"brian d foy"',
                'tidbit@sri.net',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Elaine -HFB- Ashton" <elaine@chaos.wustl.edu>, <advocacy@perl.org>',
            [
              [
                '"Elaine -HFB- Ashton"',
                'elaine@chaos.wustl.edu',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Frank Schmuck, CFO" <fschmuck@lcch.org>',
            [
              [
                '"Frank Schmuck, CFO"',
                'fschmuck@lcch.org',
                undef
              ]
            ]
          ],
          [
            '"Frank Schmuck, CFO" <fschmuck@lcch.org>, "\'abigail@foad.org\'" <abigail@foad.org>, Michael G Schwern <schwern@pobox.com>,  Nicholas Clark <nick@ccl4.org>, advocacy@perl.org',
            [
              [
                '"Frank Schmuck, CFO"',
                'fschmuck@lcch.org',
                undef
              ],
              [
                '"\'abigail@foad.org\'"',
                'abigail@foad.org',
                undef
              ],
              [
                'Michael G Schwern',
                'schwern@pobox.com',
                undef
              ],
              [
                'Nicholas Clark',
                'nick@ccl4.org',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"G. Wade Johnson" <gwadej@anomaly.org>',
            [
              [
                '"G. Wade Johnson"',
                'gwadej@anomaly.org',
                undef
              ]
            ]
          ],
          [
            '"Gabor Szabo" <gabor@tracert.com>',
            [
              [
                '"Gabor Szabo"',
                'gabor@tracert.com',
                undef
              ]
            ]
          ],
          [
            '"Greg Norris (humble visionary genius)" <nextrightmove@yahoo.com>, <advocacy@perl.org>',
            [
              [
                '"Greg Norris"',
                'nextrightmove@yahoo.com',
                '(humble visionary genius)'
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Greg Norris \\(humble visionary genius\\)" <nextrightmove@yahoo.com>',
            [
              [
                '"Greg Norris \\(humble visionary genius\\)"',
                'nextrightmove@yahoo.com',
                undef
              ]
            ]
          ],
          [
            '"Greg Norris humble visionary genius\\"" <nextrightmove@yahoo.com>',
            [
              [
                '"Greg Norris humble visionary genius\\""',
                'nextrightmove@yahoo.com',
                undef
              ]
            ]
          ],
          [
            '"Helton, Brandon" <bhelton@harris.com>, perl6-language@perl.org, advocacy@perl.org',
            [
              [
                '"Helton, Brandon"',
                'bhelton@harris.com',
                undef
              ],
              [
                undef,
                'perl6-language@perl.org',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Jan Dubois" <jand@ActiveState.com>',
            [
              [
                '"Jan Dubois"',
                'jand@ActiveState.com',
                undef
              ]
            ]
          ],
          [
            '"Jason W. May" <jasonmay@pacbell.net>',
            [
              [
                '"Jason W. May"',
                'jasonmay@pacbell.net',
                undef
              ]
            ]
          ],
          [
            '"Jason W. May" <jmay@pobox.com>',
            [
              [
                '"Jason W. May"',
                'jmay@pobox.com',
                undef
              ]
            ]
          ],
          [
            '"Jason W. May" <jmay@pobox.com>, <advocacy@perl.org>',
            [
              [
                '"Jason W. May"',
                'jmay@pobox.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ],
          [
            '"Jason W. May" <jmay@pobox.com>, advocacy@perl.org',
            [
              [
                '"Jason W. May"',
                'jmay@pobox.com',
                undef
              ],
              [
                undef,
                'advocacy@perl.org',
                undef
              ]
            ]
          ]
);

for (@list) {
  s/-- ATAT --/@/g;
  my @addrs = Email::Address->parse($_->[0]);
  my @tests = map Email::Address->new(@{$_}), @{$_->[1]};
  foreach (@addrs) {
      isa_ok $_, 'Email::Address';
      my $test = shift @tests;
      is $_->format, $test->format, $test->format;
      is "$_", $test->format, "$_";
      is $_->name, $test->name, $test->name;
  }
}
