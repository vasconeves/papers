%                                                             readme.txt
% AA vers. 7.0, LaTeX class for Astronomy & Astrophysics
% read-me file
%                                                 (c) Springer-Verlag HD
%                                                revised by EDP Sciences
%                                            tex-support@edpsciences.org
%-----------------------------------------------------------------------
%
%-----------------------------------------------------------------------
% What's New in AA v7.0 (January 2010)
%-----------------------------------------------------------------------

- The 2010 update is now compatible with the new version of the Natbib 
package, version 2009/02/02 8.3.

- The authors' institutes can also be given using labels, so that there is 
no need to rewrite the full institutes list if the order of the authors 
changes during the evaluation process.

- Notes to tables: This new version includes new commands to format the 
table notes in the proper A\& A layout. 

The following files are part of the macro package AA 

  readme.txt      This file
  aa.cls          The document class file
  aadoc.pdf       User's Guide 
  aa.dem          Example of an article (LaTeX source)


  bibtex/       Directory for BIBTeX style
   aa.bst       Bibliography style file 
   natbib.sty   This package reimplements the LaTeX \cite command 
   natnotes.pdf Brief reference sheet for Natbib        

Remember to transfer dvi and pdf files as binaries!

%-----------------------------------------------------------------------
% Tips 
%-----------------------------------------------------------------------
% How to add in-text citation clickers that link to the corresponding
% ADS abstract pages.
% contributed by Robert J. Rutten of Utrecht University.
%-----------------------------------------------------------------------

This is a latex recipe to turn the year in an in-text citation into a
clicker in the pdf or html output file that links into ADS, opening
the corresponding abstract page in your browser.  In this manner, an
on-screen reader of your paper may open the cited abstract or download
the cited paper in parallel to reading your paper, without jumping to
the reference list of the latter.  

Clicking on the author part of the citation will cause a jump to the
reference as usual.

Insert the following commands into the preamble of your latex file:
----------------------------------------
\usepackage{natbib,twoopt}
 \usepackage[breaklinks=true]{hyperref} %% to avoid \citeads line fills
 \bibpunct{(}{)}{;}{a}{}{,}    %% natbib format like A&A and ApJ
 \newcommandtwoopt{\citeads}[3][][]{\href{http://adsabs.harvard.edu/abs/#3}%
                                        {\citealp[#1][#2]{#3}}}
 \newcommandtwoopt{\citepads}[3][][]{\href{http://adsabs.harvard.edu/abs/#3}%
                                        {\citep[#1][#2]{#3}}}
 \newcommandtwoopt{\citetads}[3][][]{\href{http://adsabs.harvard.edu/abs/#3}%
                                        {\citet[#1][#2]{#3}}}
 \newcommandtwoopt{\citeyearads}[3][][]%
   {\href{http://adsabs.harvard.edu/abs/#3}{\citeyear[#1][#2]{#3}}}
-------------------------------------------

Usage: use ADS biblabels and enter one per \citeads command, as in:

---------------------------
The existence of two emission features in the solar spectrum near
12~$\mu$m was announced by
\citetads{1981ApJ...247L..97M}. %% Murcray+others, MgI features
We explained them already during the previous millennium
\citepads[see][]{1992A&A...253..567C}, %% Carlsson+Rutten+Shchukina MgI
using the standard model of the solar atmosphere formulated in the
monumental papers by \citeauthor{1973ApJ...184..605V}
(\citeyearads{1973ApJ...184..605V}, % VALI
\citeyearads{1976ApJS...30....1V}, % VALII
\citeyearads{1981ApJS...45..635V}). % VALIII
---------------------------

This trick was contributed by Robert J. Rutten of Utrecht University.
The above example of its usage is taken from his latex manual and template
for students at http://www.astro.uu.nl/~rutten/Report_recipe.html
%-----------------------------------------------------------------------
%
%-----------------------------------------------------------------------
%
% History
%-----------------------------------------------------------------------
This directory contains the LaTeX2e support for the new 2001
Astronomy and Astrophysics journal.

In order to ensure the smoothest transition for both authors and publishers,
Springer-Verlag has kindly granted EDP Sciences the permission to use the
LaTeX macro package that they developed for A&A Main journal.

Only  minor changes have been incorporated between the Springer class (1999)
and the EDP Sciences class for the new journal.
Please, note:
- that the abstract is now a command (\abstract{...}) and not an environment,  
so the \maketitle command has to be placed after the abstract and the keywords
- and that the command \thesaurus does no longer exist.

The journal is now printing using the Postscript TX Times-fonts. 
The TX fonts consist of virtual text roman fonts using Adobe Times with some 
modified and additional text symbols. 
The TX fonts are distributed under the GNU public license and are available 
in the LaTeX distributions since December 2000.
In any case, these fonts and the installation guide are also available in 
every public TeX archive server, i.e.:

http://www.tug.org/tex-archive/fonts/txfonts/
ftp://ftp.dante.de/tex-archive/fonts/txfonts/
ftp://ftp.tex.ac.uk/tex-archive/fonts/txfonts/

Please contact your system administrator to install it. 

Since this change of fonts results in a slightly different page make-up from 
CM fonts, we encourage you to use TX fonts.
To proceed, all you need is: 
\documentclass{aa}
\usepackage{txfonts}
