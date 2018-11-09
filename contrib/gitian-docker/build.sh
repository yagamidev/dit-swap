#!/bin/bash

VERSION=$1

if [[ -n "$VERSION" ]]; then
	echo ${VERSION}
else
    echo "argument error, provide commit, branch or tag"
	exit
fi

cd /gitian-builder/

./bin/gbuild --commit ditcoin=${VERSION} ../ditcoin/contrib/gitian-descriptors/gitian-linux.yml
pushd build/out
zip -r ditcoin-${VERSION}-linux-gitian.zip *
mv ditcoin-${VERSION}-linux-gitian.zip /ditcoin/
popd

./bin/gbuild --commit ditcoin=${VERSION} ../ditcoin/contrib/gitian-descriptors/gitian-win.yml
pushd build/out
zip -r ditcoin-${VERSION}-win-gitian.zip *
mv ditcoin-${VERSION}-win-gitian.zip /ditcoin/
popd

./bin/gbuild --commit ditcoin=${VERSION} ../ditcoin/contrib/gitian-descriptors/gitian-osx.yml
pushd build/out
zip -r ditcoin-${VERSION}-osx-gitian.zip *
mv ditcoin-${VERSION}-osx-gitian.zip /ditcoin/
popd

echo "build complete, files are in /ditcoin/ directory"
