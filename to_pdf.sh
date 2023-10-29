#!/bin/bash

# Convert to latex
jupyter nbconvert --to latex $1.ipynb

# Change font style
sed -r -i 's/documentclass\[11pt\]\{article\}/\documentclass\[11pt\]\{article\}\n\t\\renewcommand{\\familydefault}{\\sfdefault}\n\t\\date{\\vspace{-5ex}}/' $1.tex

# Change title
orig="$1"
bck="\\\_"
fn_bck="${orig/_/"$bck"}" 
fn_sp="${fn_bck/"$bck"/" "}" 
sed -r -i "s/$fn_bck/$fn_sp/" $1.tex


# Convert to pdf
pdflatex $1
rm $1.tex; rm $1.out; rm $1.aux; rm $1.log