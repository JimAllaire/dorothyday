
#!/bin/bash

# get variables
TITLE=$1
shift

TITLE_NOSPACES=`echo "$TITLE" | sed 's/ //g'`

# include introduction if it's available
INTRO=$TITLE_NOSPACES.intro.md
if test -e $INTRO
then
  ARTICLES=$INTRO
fi

# create temporary versions of articles
BOOK_TMP_DIR=/tmp/pandoc-make-book
rm -rf $BOOK_TMP_DIR
mkdir -p $BOOK_TMP_DIR
for ARTICLE in "$@"
do
   pandoc --template=templates/chapter.md ../_source/$ARTICLE.md -o $BOOK_TMP_DIR/$ARTICLE.md
   ARTICLES="$ARTICLES $BOOK_TMP_DIR/$ARTICLE.md"
done

# add footer
ARTICLES="$ARTICLES theme-footer.md"

# create pdf
pandoc --toc --chapters  \
       --toc-depth=1 \
       --template=templates/book.tex \
       --variable title="$TITLE" \
       --variable author="Dorothy Day" \
       --variable documentclass="book" \
       --variable classoption="oneside" \
       --variable geometry:margin=1in \
       --variable fontsize=12pt \
       $ARTICLES \
       -o "../themes/$TITLE (Dorothy Day).pdf"

# create epub
pandoc --toc --chapters  \
       --toc-depth=2 \
       --variable title="$TITLE" \
       --variable author="Dorothy Day" \
       $ARTICLES \
       -o "../themes/$TITLE (Dorothy Day).epub"







