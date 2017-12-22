#!/usr/bin/perl
# irssi-antisajoin An irssi script to part you from channels you're 
# sajoined to. Works on UnrealIRCd but could work on others with minor tweaks.
# Copyright (C) 2014  Amanda Folson <amanda@incredibl.org>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

use strict;
use Irssi;
use vars qw($VERSION %IRSSI);

my %IRSSI = (
  version		=> '0.1',
  author		=> 'Amanda Folson',
  contact		=> 'amanda@incredibl.org',
  name		=> 'irssi-antisajoin',
  uri		=> 'https://github.com/afolson/irssi-antisajoin',
  description	=> 'An irssi script to part you from channels you\'re sajoined to.',
	license		=> 'GPL',
);

sub parse_snote {
  my ($server, $msg, $nick, $address, $target) = @_;
  if ($msg =~ /You were forced to join.*/) {
    $msg =~ s/.*\W(\w)/$1/;
    $server->command("PART #$msg Try an invite instead of a sajoin?");
  }
}

Irssi::signal_add('message irc notice', 'parse_snote');
