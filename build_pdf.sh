#!/usr/bin/env sh

# builds the PDF

# setup notes:
# gem install --user asciidoctor
# gem install --user asciidoctor-pdf --pre
# gem install --user rouge
# gem install --user pygments.rb
# gem install --user coderay

TAG=$(git symbolic-ref --short HEAD)
FILENAME="Mastering Ethereum r${TAG}.pdf"

git checkout book.asciidoc
perl -pi -e "s/^= Mastering Ethereum$/= Mastering Ethereum r${TAG}/g" book.asciidoc
asciidoctor --r asciidoctor-pdf -b pdf -o book.pdf book.asciidoc

cp -a book.pdf "$FILENAME"

echo
echo $FILENAME

git checkout book.asciidoc
