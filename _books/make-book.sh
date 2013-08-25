
#!/bin/bash

# get variables
TITLE=$1
shift
FILENAME=$1
shift

# create temporary versions of articles
BOOK_TMP_DIR=/tmp/pandoc-make-book
rm -rf $BOOK_TMP_DIR
mkdir -p $BOOK_TMP_DIR
for ARTICLE in "$@"
do
   pandoc --template=templates/chapter.md ../_source/$ARTICLE.md -o $BOOK_TMP_DIR/$ARTICLE.md
   ARTICLES="$ARTICLES $BOOK_TMP_DIR/$ARTICLE.md"
done

# create pdf
pandoc --toc --chapters  \
       --toc-depth=2 \
       --template=templates/book.tex \
       --variable title="$TITLE" \
       --variable author="Dorothy Day" \
       --variable documentclass="book" \
       --variable classoption="oneside" \
       --variable geometry:margin=1in \
       --variable fontsize=11pt \
       $ARTICLES \
       -o ../$FILENAME-DorothyDay.pdf







