#!/usr/bin/env sh

# builds the PDF

TAG=$(git symbolic-ref --short HEAD)
FILENAME="Mastering Ethereum r${TAG}.pdf"

git checkout book.asciidoc
perl -pi -e "s/^= Mastering Ethereum$/= Mastering Ethereum r${TAG}/g" book.asciidoc
perl -pi -e "s/:pdf-page-size: 8in x 9in/:pdf-page-size: 8in x 14in/g" book.asciidoc

docker run --rm -it -v `pwd`:/documents/ asciidoctor/docker-asciidoctor asciidoctor -r asciidoctor-pdf -b pdf -o book.pdf book.asciidoc

cp -a book.pdf "$FILENAME"

echo
echo $FILENAME

git checkout book.asciidoc
