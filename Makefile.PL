use ExtUtils::MakeMaker;

WriteMakefile (
               AUTHOR        => 'Casey West <casey@geeknest.com>',
               ABSTRACT      => "RFC 2822 Address Parsing",
               NAME          => 'Email::Address',
               PREREQ_PM     => {
                                 'Test::More'        => '',
                                },
               VERSION_FROM  => 'lib/Email/Address.pm',
              );
