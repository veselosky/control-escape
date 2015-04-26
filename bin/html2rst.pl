#!/usr/bin/env perl
use strict;

$_ = do {local $/; <>};

my %heading = (
    h1 => '='x80,
    h2 => '*'x80,
    h3 => '-'x80,
    h4 => '~'x80,
);

# tags I don't care about
s{</?(html|head|body|!DOCTYPE|div|span|link|font).*?>}{\n}gis;
s{<!--.*?-->}{}gis;
s{<(script|style).*?>.*?</\1>}{}gis;

# for the moment, we will ignore all class attributes
s{\s+class=(["''])(.*?)\1\s*}{}gis;

# inline
s{<code>(.*?)</code>}{``$1``}gis;
s{<tt>(.*?)</tt>}{``$1``}gis;
s{<(kbd|dfn)>(.*?)</\1>}{`$2`:$1:}gis;
s{<(em|i)>(.*?)</\1>}{*$2*}gis;
s{<(strong|b)>(.*?)</\1>}{**$2**}gis;
s{<a\s+href=(["'])(.*?)\1>(.*?)</a>}{`$3 <$2>`_}gis;
s{<a\s+name=(["'])(.*?)\1>(.*?)</a>}{$3}gis;
s{&amp;}{&}gis;
s{&quot;}{"}gis;
s{&gt;}{>}gis;
s{&lt;}{<}gis;

s{<meta\s+name=(["''])(.*?)\1\s+content=(["''])(.*?)\3\s*/?>\s*}{:$2: $4\n}gis;
s{\s*<hr.*?>\s*}{\n\n----\n\n}gis;
s{\s*<br.*?>\s*}{\n}gis;

#block
s{<title>(.*?)</title>\s*}{\n$1\n$heading{h1}\n}gis;
s{<(h\d).*?>(.*?)</\1>\s*}{\n$2\n$heading{lc($1)}\n}gis;
s{<p>(.*?)</p>\s*}{\n$1\n\n}gis;
s{<(ol|ul|dl)>(.*?)</\1>\s*}{$2\n}gis;
s{<li>(.*?)</li>\s*}{* $1\n}gis;
s{<dt>(.*?)</dt>\s*}{\n$1\n}gis;
s{<dd>(.*?)</dd>\s*}{    $1\n}gis;

# FIXME Tables are too fracking complicated, I'm not touching them.
# TODO Blocks requiring indentation (pre, blockquote) will need more than a simple regex. I might get a round tuit.

# stray tags (malformed html)
s{</?p>}{\n}gis;

# cleanup extra blanks
s/\n{3,}/\n\n/gis;

print $_;
