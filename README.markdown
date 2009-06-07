README for model_graph
======================

When run from the trunk of a Rails project, produces
[DOT](http://www.graphviz.org/doc/info/lang.html "DOT Language reference")
output which can be rendered into a graph by programs such as dot and neato
and viewed with Graphviz (an [Open
Source](http://www.graphviz.org/License.php) viewer).  I use the [Mac OS X
version](http://www.pixelglow.com/graphviz/), but there's a
[Darwinports](http://darwinports.opendarwin.org/darwinports/dports/graphics/graphviz/Portfile)
(aka, Macports) version, too.  Or get the
[source](http://www.graphviz.org/Download.php "Graphviz source") and build it
yourself.  You can also import a DOT file with OmniGraffle, but it doesn't
support all the edge decorations that I'm using.

* DOT format::           http://www.graphviz.org/doc/info/lang.html
* Graphviz license::     http://www.graphviz.org/License.php
* Mac OS X Graphviz::    http://www.pixelglow.com/graphviz/
* Darwinports Graphviz:: http://darwinports.opendarwin.org/darwinports/dports/graphics/graphviz/Portfile
* Graphviz source code:: http://www.graphviz.org/Download.php

This is *certainly* a work-in-progress.

## Usage: ##

    rake model_graph

Or call the executable directly:

    model_graph

then open tmp/model_graph.dot with a viewer.  Using `model_graph --debug`
will write a bunch of the raw information obtained from reflecting on the
ActiveRecord model classes into the output as comments (including some things
that don't actually affect the final graph).

See the documentation for `ModelGraph#do_graph` for some additional options.

## Bugs: ##

The ordering within DOT is based on the tail-to-head relationship of edges,
but these are somewhat arbitrarily determined by the current reflection on
ActiveRecord associations.  The use of the EDGES= and NODES= options is only
a partial fix.

## TODO: ##

* deal with :as in a better way (now made dashed)
* deal with :polymorphic better (now make bold and blue)
* handle indirect descendants of ActiveRecord::Base? (at least make it
  clearer how they're filtered out of the graph)
* models that have no (outbound) associations are depicted in red, but
  sometimes these are just confused by an overridden class (even with :as)

Credits:
--------

Inspired by: Matt Biddulph at August 2, 2006 02:57 PM
URL:  http://www.hackdiary.com/archives/000093.html

----

This is released under the MIT License.  Please send comments or
enhanncement ideas to Rob[at]AgileConsultingLLC[dot]com or
Rob_Biedenharn[at]alum[dot]mit[dot]edu

Copyright (c) 2006-2009 Rob Biedenharn

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
