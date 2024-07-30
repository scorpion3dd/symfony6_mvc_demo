# This file is part of the Universal Docker stand for web development project.
#
# This project is no longer maintained.
# The project is written as Universal Docker stand Release.
#
# @link https://github.com/scorpion3dd
# @author Denis Puzik <scorpion3dd@gmail.com>
# @copyright Copyright (c) 2022-2023 scorpion3dd

FROM mysql:8.0.33

COPY jenkins.my.cnf /etc/mysql/my.cnf

EXPOSE 3306