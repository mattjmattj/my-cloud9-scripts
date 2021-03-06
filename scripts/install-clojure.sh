#!/bin/bash

function install_leiningen {
	if ! which lein >> /dev/null
	then
		echo "Installing leiningen"
		wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -O /tmp/lein
		chmod 0777 /tmp/lein
		sudo mv /tmp/lein /usr/local/bin/
		sudo chown root:root /usr/local/bin/lein
		lein
	fi
}

function install_clojure {
	if ! [ -e $HOME/workspace/clojure ]
	then
		wget http://repo1.maven.org/maven2/org/clojure/clojure/1.6.0/clojure-1.6.0.zip -O /tmp/clojure-1.6.0.zip
		cd /tmp && unzip clojure-1.6.0.zip && cd -
		mv /tmp/clojure-1.6.0 $HOME/workspace/clojure
	fi
}

function install_aliases {
	aliases=$HOME/.bash_aliases
	echo "" >> $aliases
	
	if ! alias | grep clojure-repl=
	then
		echo "alias clojure-repl='java -cp $HOME/workspace/clojure/clojure-1.6.0.jar clojure.main'" >> $aliases
	fi
}

install_leiningen
install_clojure
install_aliases