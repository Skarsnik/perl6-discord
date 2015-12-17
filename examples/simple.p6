use Discord;

say "Hello";
my $disc = Discord::Client.new;

say "Loging incoming";
$disc.login($*ARGV[0], $*ARGV[1]);
say "Logged";

react {
  whenever Supply.interval(1) {
    my @msg = $disc.get-messages($disc.me<QuillnBlade><qnb-general-sfw>);
    for @msg -> $msg {
      say $msg.content;
      if $msg ~~ /^Hello $disc.me.name/ {
        $disc.send-message($disc.me<QuillnBlade><qnb-general-sfw>);
      }
    }
  }
}

