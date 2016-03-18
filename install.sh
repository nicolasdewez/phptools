#!/bin/bash

NOCOLOR='\e[0m'
REDCOLOR='\e[37;41m'

if [[ $EUID -ne 0 ]]; then
   echo -e "$REDCOLOR Think to run this bash script as root$NOCOLOR"
    IS_ROOT=0
else
    IS_ROOT=1
fi

PHPTOOLS=`pwd`

if [[ $IS_ROOT = 1 ]]; then
    if [[ `which php` ]] ; then
        if [[ ! -f /etc/php5/mods-available/90-my.ini ]]; then
            echo 'Install php default configuration'
            ln -sf $PHPTOOLS/config/90-my.ini /etc/php5/mods-available/90-my.ini
        fi

        if [[ ! -f /usr/local/bin/composer ]]; then
            echo 'Install Composer'
            curl -sS https://getcomposer.org/installer | php
            chmod a+x composer.phar
            mv composer.phar /usr/local/bin/composer
        fi

        if [[ ! -f /usr/local/bin/melody ]]; then
            echo 'Install Melody'
            curl http://get.sensiolabs.org/melody.phar -o melody
            chmod a+x melody
            mv melody /usr/local/bin/melody
        fi

        if [[ ! -f /usr/local/bin/php-cs-fixer ]]; then
            echo 'Install PHP-CS-Fixer'
            curl http://get.sensiolabs.org/php-cs-fixer.phar -o php-cs-fixer
            chmod a+x php-cs-fixer
            mv php-cs-fixer /usr/local/bin/php-cs-fixer
        fi

        if [[ ! -f /usr/local/bin/phpmd ]]; then
            echo 'Install PHP-MD'
            curl http://static.phpmd.org/php/latest/phpmd.phar -o phpmd
            chmod a+x phpmd
            mv phpmd /usr/local/bin/phpmd
        fi

        if [[ ! -f /usr/local/bin/security-checker ]]; then
            echo 'Install Security Checker'
            curl http://get.sensiolabs.org/security-checker.phar -o security-checker
            chmod a+x security-checker
            mv security-checker /usr/local/bin/security-checker
        fi

        if [[ ! -f /usr/local/bin/symfony ]]; then
            echo 'Install Symfony installer'
            curl https://symfony.com/installer -o symfony
            chmod a+x symfony
            mv symfony /usr/local/bin/symfony
        fi

        if [[ ! -f /usr/local/bin/symfony-upgrade-fixer ]]; then
            echo 'Install Symfony upgrade fixer'
            wget https://github.com/umpirsky/Symfony-Upgrade-Fixer/releases/download/v0.1.3/symfony-upgrade-fixer.phar
            chmod a+x symfony-upgrade-fixer.phar
            mv symfony-upgrade-fixer.phar /usr/local/bin/symfony-upgrade-fixer
        fi

        if [[ ! -f /usr/local/bin/sami ]]; then
            echo 'Install Sami'
            curl http://get.sensiolabs.org/sami.phar -o sami
            chmod a+x sami
            mv sami /usr/local/bin/sami
        fi
    fi
fi
