#!/usr/bin/perl -w
# github.com/g4br13I/perlscanner

use IO::Socket;
$h = $ARGV[0];

print <<EOF;
       ,-.                    .\'\\ _
      ,\'   \\                 .\'   (_)
     J     \'-._ /\\         .\'     (,_)
    /  _  /   ,\'\# )_       _\\_     (_)
   /  \'_Y\'   /_.,\'  \\     (  _\')     \\
   | _ /   ,\'\\/  .   |    \'.  __)     \\
   |\'.Y   / \# ) --\'  /  _.-\'  __)    .\'
_._\\,\'  ,\'__,\'      /  _\\    / \\   .\'
  ,\'-_ /           _.-\' _\\  /   \\.\'
 \'    (_       _.-\' _.-\'  \\/        \@g4br13I
        \\  _.-\' _.-\' \'-.     ./
         -\'  .-\'        \'-.-\'/
         |   \\o     _.-\'\#\#\#\#/
         |    \\o_.-\' \\\#\#\#\#\#/
         |_.-\#\\       \\\#\#\#/
         \#\#\#\#\#\#\\       \\/\'
         \# \#\#\#\#\#`-.

EOF

if($#ARGV+1 != 1) {
        die "\033[91m[-]\033[0m perl $0 <host>\n";
}
print "\033[93m[i]\033[0m scanning ports\n";
my @portas = (1..65535);
foreach $p (@portas) {
        $nome = getservbyport($p,"tcp");
        $c = IO::Socket::INET->new(PeerAddr => $h, PeerPort => $p, Proto => "tcp", Timeout => 1);
        if($c){
                print "\033[92m[+]\033[0m port ",$p," (",$nome,") open\n";
        }
}
