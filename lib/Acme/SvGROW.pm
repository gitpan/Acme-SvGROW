package Acme::SvGROW;

require Exporter;
@ISA = qw(Exporter);

@EXPORT = qw(
	SvGROW	
);

$VERSION = '0.02';

eval <<'LVAL' or eval <<'NOLVAL';
sub SvGROW($$) : lvalue {
  my $tmp = $_[0];
  $_[0] = pack 'x'.int(0+$_[1]);
  $_[0] = $tmp;
  $_[0]
}
1;
LVAL
sub SvGROW($$) {
  my $tmp = $_[0];
  $_[0] = pack 'x'.int(0+$_[1]);
  $_[0] = $tmp;
  $_[0]
}
NOLVAL

1;
__END__

=head1 NAME

Acme::SvGROW - syntax for pre-extending a string's storage,
like the proposed use of C<length> as an L-value

=head1 SYNOPSIS

  use Acme::SvGROW;
  SvGrow($BigString, 100000);
  # when l-value subroutines are available (5.8 and later)
  SvGrow($BigString, 100000) = InitialValueOfBigString();

=head1 DESCRIPTION

Trivial module implementing string storage preallocation using
techniques shared on perl5-porters mailing list November 4 and 5, 2009

=head1 EXPORT

the C<SvGROW> subroutine is exported. It takes two arguments,
the first the string to extend and the second the length.

=head1 SEE ALSO

L<perlguts>

The author is in favor of allowing C<length> to
be used as an lvalue to thinly invoke the SvGROW internals macro

=head1 AUTHOR

David Nicol davidnico@cpan.org

=head1 COPYRIGHT AND LICENSE

Public domain: use at will.

=cut

