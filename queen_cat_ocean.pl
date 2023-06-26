#!/usr/bin/perl

# This program displays a simple message

# Music Matters

# Load the CGI module
use CGI;

# Create a new CGI object
my $cgi = CGI->new;

# Create a Header
print $cgi->header;

# Create a start HTML
print $cgi->start_html('Music Matters');

# Create the mainparagraph
print "<p>Music matters to everyone, in infinitely different ways. As individuals, we use it to reflect our emotions, to communicate, to remember, and to help us grow. As a society, music is the soundtrack to our lives – it helps define us, shape our culture, and bring us closer together.</p>";

# Create a main heading
print "<h1>Music Matters</h1>";

# Create the main paragraph
print "<p>The importance of music is something that most people take for granted. We listen to music every day – in shops, on the radio, in our homes, and on our phones. Music has the power to create memories, to express feelings, and to tell stories in ways that words can’t.</p>";

# Create a subheading
print "<h2>The Power of Music</h2>";

# Create the subheading paragraph
print "<p>Music has the power to move us, to transform us, and to take us on a journey. It can create an atmosphere, evoke memories, and even change the way we think and feel. Music can help us to relax, to focus, and to connect with others in ways that are not possible through spoken words.</p>";

# Create an image
print "<img src="music-matters.jpeg" alt="music matters">";

# Create a closing paragraph
print "<p>At its heart, music is a powerful expression of emotion. It's a way to explore our inner thoughts, to express our feelings, and to tell stories. It can bring joy, provide comfort, and even inspire change. Music matters because it speaks to us in ways words can't – it moves us, comforts us, and unites us.</p>";

# Create a closing HTML
print $cgi->end_html;