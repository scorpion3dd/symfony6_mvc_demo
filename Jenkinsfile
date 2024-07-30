def PHP_INSTALL_XDEBUG
def PHP_TIMEZONE
def PHP_USER_ID
def PHP_USER_NAME
def PHP_GROUP_ID
def PHP_GROUP_NAME
def PHP_CORS_ALLOW_ORIGIN
def COMPOSER_MEMORY_LIMIT
def TERM


def DOCKER_HOST

def MONGO_HOST
def MONGO_PORT
def MONGO_CONNECT_USER
def MONGO_CONNECT_PASSWORD
def MONGO_CONNECT_ROLE
def MONGO_CONNECT_DB
def MONGO_CONNECT_DB_INTEGRATION
def MONGO_CONNECT_COLLECTION
def MONGO_INITDB_DATABASE
def MONGO_INITDB_ROOT_USERNAME
def MONGO_INITDB_ROOT_PASSWORD

def DATABASE_URL
def MYSQL_HOST
def MYSQL_PORT
def MYSQL_SERVER_VERSION
def MYSQL_CHARSET
def MYSQL_DATABASE
def MYSQL_ROOT_USER
def MYSQL_ROOT_PASSWORD
def MYSQL_USER
def MYSQL_PASSWORD
def MYSQL_DATABASE_INTEGRATION
def MYSQL_USER_INTEGRATION
def MYSQL_PASSWORD_INTEGRATION

def REDIS_HOST
def REDIS_URL

def JENKINS_PROJECT_NAME
def JENKINS_PATH_CACHE
def JENKINS_PROJECT_NETWORK
def JENKINS_NAME
def JENKINS_CONTAINER_NAME
def JENKINS_IMAGE_NAME
def JENKINS_CONTAINER_AGENT
def JENKINS_IMAGE_MYSQL
def JENKINS_CONTAINER_MYSQL
def JENKINS_IMAGE_MONGO
def JENKINS_CONTAINER_MONGO
def JENKINS_IMAGE_REDIS
def JENKINS_CONTAINER_REDIS

def POST_ALLURE_REPORTINT
def POST_CLOVER_REPORTINT
def POST_PUBLISHING
def POST_EMAIL_SENDING

def SONAR_PROJECT_KEY
def SONAR_PROJECT_BASE_DIR
def SONAR_PROJECT_BASE_URL
def SONAR_PROJECT_TOKEN
def SONAR_CONTAINER_SCANNER_START
def SONAR_CONTAINER_SCANNER_RUN

def BASE_DIR

node {
  PHP_INSTALL_XDEBUG = "true"
  PHP_TIMEZONE = "Europe/Madrid"
  PHP_USER_ID = "33"
  PHP_USER_NAME = "www-data"
  PHP_GROUP_ID = "33"
  PHP_GROUP_NAME = "www-data"
  PHP_CORS_ALLOW_ORIGIN = '^http?://(localhost|127\\.0\\.0\\.1)(:[0-9]+)?$'
  COMPOSER_MEMORY_LIMIT = "-1"
  TERM = "xterm"

  DOCKER_HOST = "host.docker.internal"

  MONGO_HOST = DOCKER_HOST
  MONGO_PORT = "27017"
  MONGO_CONNECT_USER = "admin"
  MONGO_CONNECT_PASSWORD = "pass123"
  MONGO_CONNECT_ROLE = "readWrite"
  MONGO_CONNECT_DB = "learn"
  MONGO_CONNECT_DB_INTEGRATION = "learn_integration"
  MONGO_CONNECT_COLLECTION = "logs"
  MONGO_INITDB_DATABASE = "learn"
  MONGO_INITDB_ROOT_USERNAME = "root"
  MONGO_INITDB_ROOT_PASSWORD = "root"

  MYSQL_HOST = DOCKER_HOST
  MYSQL_PORT = "3306"
  MYSQL_SERVER_VERSION = "8"
  MYSQL_CHARSET = "utf8mb4"
  MYSQL_DATABASE = "learn"
  MYSQL_ROOT_USER = "root"
  MYSQL_ROOT_PASSWORD = "root"
  MYSQL_USER = "learn"
  MYSQL_PASSWORD = "learn123"
  MYSQL_DATABASE_INTEGRATION = "learn_test"
  MYSQL_USER_INTEGRATION = "learn_test"
  MYSQL_PASSWORD_INTEGRATION = "learn_test123"
  DATABASE_URL = "mysql://" + MYSQL_USER + ":" + MYSQL_PASSWORD +
    "@" + MYSQL_HOST + ":" + MYSQL_PORT + "/" + MYSQL_DATABASE +
    "?serverVersion=" + MYSQL_SERVER_VERSION + "&charset=" + MYSQL_CHARSET

  REDIS_HOST = DOCKER_HOST
  REDIS_URL = "redis://" + REDIS_HOST

  JENKINS_PROJECT_NAME = "Demo_symfony6"
  JENKINS_PATH_CACHE = "/var/jenkins_home/cache_projects/"
  JENKINS_NAME = "jenkins_demo_symfony6"
  JENKINS_PROJECT_NETWORK = "${JENKINS_NAME}_network"
  JENKINS_CONTAINER_NAME = "${JENKINS_NAME}_container"
  JENKINS_IMAGE_NAME = "${JENKINS_NAME}_image"
  JENKINS_CONTAINER_AGENT = "${JENKINS_CONTAINER_NAME}_agent"
  JENKINS_IMAGE_MYSQL = "${JENKINS_IMAGE_NAME}_mysql"
  JENKINS_CONTAINER_MYSQL = "${JENKINS_CONTAINER_NAME}_mysql"
  JENKINS_IMAGE_MONGO = "${JENKINS_IMAGE_NAME}_mongo"
  JENKINS_CONTAINER_MONGO = "${JENKINS_CONTAINER_NAME}_mongo"
  JENKINS_IMAGE_REDIS = "${JENKINS_IMAGE_NAME}_redis"
  JENKINS_CONTAINER_REDIS = "${JENKINS_CONTAINER_NAME}_redis"

  POST_ALLURE_REPORTINT = false
  POST_CLOVER_REPORTINT = true
  POST_PUBLISHING = true
  POST_EMAIL_SENDING = false

  SONAR_PROJECT_KEY = "Learn-Symfony-6"
  SONAR_PROJECT_BASE_DIR = "/usr/src/project"
  SONAR_PROJECT_BASE_URL = "http://sonarqube:9000"
  SONAR_PROJECT_TOKEN = "sqp_d52c2c4d5cd4ced671dd2787839083c47e52370d"
  SONAR_CONTAINER_SCANNER_START = "loc_service_sonar_scanner_start_demo_symfony6"
  SONAR_CONTAINER_SCANNER_RUN = "loc_service_sonar_scanner_run_demo_symfony6"

  BASE_DIR = "c:/docker/my/demo/symfony6-mvc/www/back"
}
import java.util.concurrent.TimeUnit
pipeline {
    agent {
        dockerfile {
            filename 'JenkinsPhp.Dockerfile'
            dir "/var/jenkins_home/workspace/" + JENKINS_PROJECT_NAME + "/www/back"
            additionalBuildArgs "--build-arg PHP_TIMEZONE='" + PHP_TIMEZONE + "' " +
                                "--build-arg PHP_USER_ID='" + PHP_USER_ID + "' " +
                                "--build-arg PHP_USER_NAME='" + PHP_USER_NAME + "' " +
                                "--build-arg PHP_GROUP_ID='" + PHP_GROUP_ID + "' " +
                                "--build-arg PHP_GROUP_NAME='" + PHP_GROUP_NAME + "' " +
                                "--build-arg PHP_CORS_ALLOW_ORIGIN='" + PHP_CORS_ALLOW_ORIGIN + "' " +
                                "--build-arg PHP_INSTALL_XDEBUG='" + PHP_INSTALL_XDEBUG + "' " +
                                "--build-arg COMPOSER_MEMORY_LIMIT='" + COMPOSER_MEMORY_LIMIT + "' " +
                                "--build-arg TERM='" + TERM + "' " +

                                "--build-arg MONGO_HOST='" + MONGO_HOST + "' " +
                                "--build-arg MONGO_PORT='" + MONGO_PORT + "' " +
                                "--build-arg MONGO_CONNECT_USER='" + MONGO_CONNECT_USER + "' " +
                                "--build-arg MONGO_CONNECT_PASSWORD='" + MONGO_CONNECT_PASSWORD + "' " +
                                "--build-arg MONGO_CONNECT_DB='" + MONGO_CONNECT_DB + "' " +
                                "--build-arg MONGO_CONNECT_DB_INTEGRATION='" + MONGO_CONNECT_DB_INTEGRATION + "' " +
                                "--build-arg MONGO_CONNECT_COLLECTION='" + MONGO_CONNECT_COLLECTION + "' " +
                                "--build-arg MONGO_INITDB_ROOT_USERNAME='" + MONGO_INITDB_ROOT_USERNAME + "' " +
                                "--build-arg MONGO_INITDB_ROOT_PASSWORD='" + MONGO_INITDB_ROOT_PASSWORD + "' " +

                                "--build-arg DATABASE_URL='" + DATABASE_URL + "' " +
                                "--build-arg MYSQL_HOST='" + MYSQL_HOST + "' " +
                                "--build-arg MYSQL_PORT='" + MYSQL_PORT + "' " +
                                "--build-arg MYSQL_SERVER_VERSION='" + MYSQL_SERVER_VERSION + "' " +
                                "--build-arg MYSQL_CHARSET='" + MYSQL_CHARSET + "' " +
                                "--build-arg MYSQL_DATABASE='" + MYSQL_DATABASE + "' " +
                                "--build-arg MYSQL_USER='" + MYSQL_USER + "' " +
                                "--build-arg MYSQL_PASSWORD='" + MYSQL_PASSWORD + "' " +
                                "--build-arg MYSQL_DATABASE_INTEGRATION='" + MYSQL_DATABASE_INTEGRATION + "' " +
                                "--build-arg MYSQL_USER_INTEGRATION='" + MYSQL_USER_INTEGRATION + "' " +
                                "--build-arg MYSQL_PASSWORD_INTEGRATION='" + MYSQL_PASSWORD_INTEGRATION + "' " +

                                "--build-arg REDIS_HOST='" + REDIS_HOST + "' " +
                                "--build-arg REDIS_URL='" + REDIS_URL + "' "
            args "-v /var/run/docker.sock:/var/run/docker.sock " +
                 "-v /var/jenkins_home/workspace/" + JENKINS_PROJECT_NAME + "/log/back/php:/var/log " +
                 "-p 9003:9000 " +
//                  "--network=" + JENKINS_PROJECT_NETWORK + " " +
                 "--name " + JENKINS_CONTAINER_AGENT
        }
    }
    parameters {
        choice(name: 'PHP_LINTERS', choices: ['true', 'false'], description: 'PHP check linters (true/false)')
        choice(name: 'PHP_TESTS_UNIT', choices: ['true', 'false'], description: 'PHP check unit tests (true/false)')
        choice(name: 'PHP_TESTS_INTEGRATION', choices: ['true', 'false'], description: 'PHP check integration tests (true/false)')
        choice(name: 'PHP_TESTS_FUNCTIONAL', choices: ['true', 'false'], description: 'PHP check functional tests (true/false)')
        choice(name: 'PHP_SONARQUBE', choices: ['true', 'false'], description: 'PHP check SonarQube Analysis (true/false)')
    }
    stages {
        stage('Install PHP extensions and composer libraries') {
            steps {
                sh 'id'
                sh 'cat /etc/group'
                sh 'cat /etc/passwd'
                sh 'pwd'
//                 sh "find / -type f -iname 'xdebug.so' 2>/dev/null || true"
                sh 'php -v'
                sh 'php -m'
                sh 'composer -V'
                sh 'node -v'
                sh 'ls -la'
                sh 'printenv'
//                 sh 'java -version'
                sh 'docker --version'
                sh 'cat /etc/group | grep docker'
                sh 'ls -l /var/run/docker.sock'
                sh 'ls -ld /var/log'
                sh 'ls -la /var/log'
//                 sh 'sudo chown -R 1000:1000 "/var/log"'
//                 sh 'sudo chmod -R 777 /var/log'
//                 sh "find / -type f -iname 'xdebug.log' 2>/dev/null || true"
//                 sh "find / -type f -iname 'php_error.log' 2>/dev/null || true"
                sh "ls -la /var/jenkins_home/workspace/" + JENKINS_PROJECT_NAME + "/log/back/php"
                sh "ls -ld /var/jenkins_home/workspace/" + JENKINS_PROJECT_NAME + "/log/back/php"
                echo "PHP_LINTERS = ${params.PHP_LINTERS}"
                echo "PHP_TESTS_UNIT = ${params.PHP_TESTS_UNIT}"
                echo "PHP_TESTS_INTEGRATION = ${params.PHP_TESTS_INTEGRATION}"
                echo "PHP_TESTS_FUNCTIONAL = ${params.PHP_TESTS_FUNCTIONAL}"
                echo "PHP_SONARQUBE = ${params.PHP_SONARQUBE}"
                script {
                    if (fileExists('./www/back/project_init.sh')) {
                        dir('./www/back') {
                            sh 'ls -ld ./.env.test'
                            sh 'ls -ld ./project_init.sh'
                            sh 'chmod +x ./project_init.sh'
                            sh './project_init.sh'
                        }
                    } else {
                        error './www/back/project_init.sh not found'
                    }
                    if (fileExists('./www/back/composer.json')) {
                        def composerCache = env['composerCacheKey']
                        def composerJsonHash = sh(script: 'md5sum www/back/composer.json | cut -d " " -f1', returnStdout: true).trim()
                        echo 'composerJsonHash = ' + composerJsonHash
                        dir('./www/back') {
                            if (!composerCache || env['composerJsonHash'] != composerJsonHash) {
                                echo 'Install Composer libraries'
                                if (fileExists('composer.lock') && fileExists('vendor')) {
                                    echo 'Both composer.lock and vendor directory exist'
                                } else {
                                    echo 'Either composer.lock or vendor directory does not exist'
//                                 sh 'rm -rf vendor'
//                                 sh 'composer install'
                                    sh 'composer install --no-scripts'
                                }
                                env['composerCacheKey'] = 'cached'
                                env['composerJsonHash'] = composerJsonHash
                            }
                            sh 'ls -la vendor'
                            sh 'composer update --no-scripts'
                            sh 'composer validate'
                            dir('./config/jwt') {
                                if (fileExists('private.pem') && fileExists('public.pem')) {
                                    echo 'Both files private.pem and public.pem exist'
                                } else {
                                    echo 'Either files private.pem or public.pem does not exist'
                                    sh 'composer jwt-generate-keypair'
                                }
                            }
                        }
                    } else {
                        error './www/back/composer.json not found'
                    }
                }
            }
        }
        stage('Install NPM libraries') {
            steps {
                sh 'id'
                script {
                    echo 'composerCacheKey = ' + env['composerCacheKey']
                    echo 'composerJsonHash = ' + env['composerJsonHash']
                    if (fileExists('./www/back/package.json')) {
                        def npmCacheDir = JENKINS_PATH_CACHE + JENKINS_PROJECT_NAME + '/npm'
                        echo 'npmCacheDir = ' + npmCacheDir
                        def npmCacheFileHash = JENKINS_PATH_CACHE + JENKINS_PROJECT_NAME + '/npm/packageJsonHash.txt'
                        echo 'npmCacheFileHash = ' + npmCacheFileHash
                        def npmCacheHashValue
                        if (fileExists(npmCacheFileHash)) {
                            echo 'npmCacheFileHash file exists, initializing npmCacheHashValue from file'
                            npmCacheHashValue = readFile(npmCacheFileHash).trim()
                        } else {
                            echo 'npmCacheFileHash not found, initializing npmCacheHashValue as empty'
                            npmCacheHashValue = ''
                        }
                        echo 'npmCacheHashValue = ' + npmCacheHashValue
                        def packageJsonHash = sh(script: 'md5sum www/back/package.json | cut -d " " -f1', returnStdout: true).trim()
                        echo 'packageJsonHash before install = ' + packageJsonHash
                        if (npmCacheHashValue != packageJsonHash) {
                            dir('./www/back') {
                                def folderExists = sh(script: '[ -d "node_modules" ]', returnStatus: true) == 0
                                if (fileExists('package-lock.json') && folderExists) {
                                    echo 'Using installed NPM packages'
                                } else {
                                     echo 'Install NPM packages'

                                     sh "rm -rf ${npmCacheDir}"
                                     sh "mkdir -p ${npmCacheDir}"
                                     sh "chmod -R u+w ${npmCacheDir}"

                                     sh 'mkdir -p /var/jenkins_home/.npm'
//                                      sh 'chown -R 1000:1000 "/var/jenkins_home/.npm"'
//                                      sh 'chmod -R u+w /var/jenkins_home/.npm'
                                     sh 'ls -ld /var/jenkins_home/.npm'

                                     sh 'composer jenkins-npm-cache-clean-force'
//                                      sh 'rm -rf node_modules'
                                     sh 'composer jenkins-npm-install-all'
                                     sh 'composer jenkins-npm-audit-fix'
                                     sh 'composer jenkins-symfony-npm-ci'
                                     sh 'ls -la node_modules'

                                     sh "cp -r node_modules ${npmCacheDir}/"
                                     sh "ls -la ${npmCacheDir}/node_modules"

                                     sh 'composer symfony-npm-run-dev'
                                     sh 'ls -la public'

                                     packageJsonHash = sh(script: 'md5sum www/back/package.json | cut -d " " -f1', returnStdout: true).trim()
                                     echo 'packageJsonHash after install = ' + packageJsonHash
                                     writeFile file: npmCacheFileHash, text: packageJsonHash
                                }
                            }
                        } else {
                            echo 'Using cached NPM packages'
//                             sh "cp -r ${npmCacheDir}/node_modules ./www/back/"
                        }
                    } else {
                        error './www/back/package.json not found'
                    }
                }
            }
        }
        stage('Start containers: DB MySQL, MongoDB, Redis') {
            when {
                expression {
                    def value1 = params.PHP_TESTS_INTEGRATION
                    echo "PHP_TESTS_INTEGRATION = ${value1}"
                    def value2 = params.PHP_TESTS_FUNCTIONAL
                    echo "PHP_TESTS_FUNCTIONAL = ${value2}"

                    return value1 == "true" || value2 == "true"
                }
            }
            steps {
                sh 'id'
                sh 'groups'
                sh 'docker --version'
//                      Error:
//                 permission denied while trying to connect to the Docker daemon socket at
//                 unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.46/networks":
//                 dial unix /var/run/docker.sock: connect: permission denied
//                      Solution:
//                 make jenkins_docker
                sh "docker network ls"
                sh "docker images"
                sh "docker images ${JENKINS_IMAGE_MYSQL}"
                script {
                    if (fileExists('./www/back/JenkinsMysql.Dockerfile')) {
                        dir('./www/back') {
//                             def networkExists = sh(script: "docker network ls -q -f name=${JENKINS_PROJECT_NETWORK}", returnStatus: true) == 0
                            def networkExists = sh(script: "docker network inspect ${JENKINS_PROJECT_NETWORK} > /dev/null 2>&1", returnStatus: true) == 0
                            if (networkExists) {
                                echo "Network ${JENKINS_PROJECT_NETWORK} - exists, delete network"
                                sh "docker network rm -f ${JENKINS_PROJECT_NETWORK}"
                            }
                            sh "docker network create ${JENKINS_PROJECT_NETWORK}"
                            sh "docker network connect ${JENKINS_PROJECT_NETWORK} ${JENKINS_CONTAINER_AGENT}"

                            sh "docker build -t ${JENKINS_IMAGE_MYSQL} -f JenkinsMysql.Dockerfile ."
                            sh "docker run --network=${JENKINS_PROJECT_NETWORK} " +
                                "--name ${JENKINS_CONTAINER_MYSQL} -d " +
                                "-p 3306:3306 " +
                                "-e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} " +
                                "-e MYSQL_DATABASE=${MYSQL_DATABASE} " +
                                "-e MYSQL_USER=${MYSQL_USER} " +
                                "-e MYSQL_PASSWORD=${MYSQL_PASSWORD} " +
                                "${JENKINS_IMAGE_MYSQL} " +
                                "--default-authentication-plugin=mysql_native_password " +
                                "--init-connect='SET NAMES utf8;'"
                        }
                    } else {
                        error 'JenkinsMysql.Dockerfile not found'
                    }
                    if (fileExists('./www/back/JenkinsMongo.Dockerfile')) {
                        dir('./www/back') {
                            sh "docker build -t ${JENKINS_IMAGE_MONGO} -f JenkinsMongo.Dockerfile " +
                                                "--build-arg MONGO_CONNECT_USER='${MONGO_CONNECT_USER}' " +
                                                "--build-arg MONGO_CONNECT_PASSWORD='${MONGO_CONNECT_PASSWORD}' " +
                                                "--build-arg MONGO_CONNECT_DB='${MONGO_CONNECT_DB}' " +
                                                "--build-arg MONGO_CONNECT_ROLE='${MONGO_CONNECT_ROLE}' " +
                                                "--build-arg MONGO_CONNECT_DB_INTEGRATION='${MONGO_CONNECT_DB_INTEGRATION}' " +
                                                "--build-arg MONGO_CONNECT_COLLECTION='${MONGO_CONNECT_COLLECTION}' ."
                            sh "docker run --network=${JENKINS_PROJECT_NETWORK} " +
                                "--name ${JENKINS_CONTAINER_MONGO} -d " +
                                "-p 27017:27017 " +
                                "-e MONGO_INITDB_DATABASE=${MONGO_INITDB_DATABASE} " +
                                "-e MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME} " +
                                "-e MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD} " +
                                "${JENKINS_IMAGE_MONGO} " +
                                "mongod --auth"

                        }
                    } else {
                        error 'JenkinsMongo.Dockerfile not found'
                    }
                    if (fileExists('./www/back/JenkinsRedis.Dockerfile')) {
                        dir('./www/back') {
                            sh "docker build -t ${JENKINS_IMAGE_REDIS} -f JenkinsRedis.Dockerfile ."
                            sh "docker run --network=${JENKINS_PROJECT_NETWORK} " +
                                "--name ${JENKINS_CONTAINER_REDIS} -d " +
                                "-p 6379:6379 " +
                                "-e ALLOW_EMPTY_PASSWORD=yes " +
                                "${JENKINS_IMAGE_REDIS} " +
                                "redis-server --save 20 1 " +
                                "--loglevel notice "
                        }
                    } else {
                        error 'JenkinsRedis.Dockerfile not found'
                    }
                }
                sh "docker images ${JENKINS_IMAGE_MYSQL}"
                sh "docker images ${JENKINS_IMAGE_MONGO}"
                sh "docker images ${JENKINS_IMAGE_REDIS}"

                sh "docker ps --filter 'name=${JENKINS_CONTAINER_MYSQL}'"
                sh "docker ps --filter 'name=${JENKINS_CONTAINER_MONGO}'"
                sh "docker ps --filter 'name=${JENKINS_CONTAINER_REDIS}'"

                sh "cp .env.dist .env"
                sh "cp .env.nginx.local.dist .env.nginx.local"

                script {
                    try {
                        echo "JENKINS_IMAGE_MYSQL: ${JENKINS_IMAGE_MYSQL}"
                        echo "JENKINS_CONTAINER_MYSQL: ${JENKINS_CONTAINER_MYSQL}"
                        echo "MYSQL_USER: ${MYSQL_USER}"
                        echo "MYSQL_PASSWORD: ${MYSQL_PASSWORD}"
                        echo "MYSQL_DATABASE: ${MYSQL_DATABASE}"
                        def sql = "SELECT CURRENT_USER();"
                        echo "SQL: ${sql}"
                        def result = sh(script: "docker exec -i ${JENKINS_CONTAINER_MYSQL} mysql " +
                                            "-u${MYSQL_USER} -p${MYSQL_PASSWORD} " +
                                            "-S /var/run/mysqld/mysqld.sock " +
                                            "-e \"${sql}\" --verbose ${MYSQL_DATABASE}",
                                            returnStdout: true).trim()
                        echo "Current user MySql DB: ${result}"
                    } catch (Exception e) {
                        echo "Error executing SQL query to MySql DB:"
                        echo "Error exception message: ${e.message}"
                        echo "Error exception: ${e}"
                    }

                    try {
                        echo "JENKINS_IMAGE_MONGO: ${JENKINS_IMAGE_MONGO}"
                        echo "JENKINS_CONTAINER_MONGO: ${JENKINS_CONTAINER_MONGO}"
                        echo "MONGO_CONNECT_USER: ${MONGO_CONNECT_USER}"
                        echo "MONGO_CONNECT_PASSWORD: ${MONGO_CONNECT_PASSWORD}"
                        echo "MONGO_INITDB_DATABASE: ${MONGO_INITDB_DATABASE}"
                        def sql = "db.runCommand({connectionStatus: 1})"
                        echo "SQL: ${sql}"
                        def result = sh(script: "docker exec -i ${JENKINS_CONTAINER_MONGO} mongosh " +
                            "-u ${MONGO_CONNECT_USER} -p ${MONGO_CONNECT_PASSWORD} " +
                            "--authenticationDatabase ${MONGO_INITDB_DATABASE} " +
                            "--eval \"${sql}\"",
                            returnStdout: true).trim()
                        echo "Current user Mongo DB: ${result}"
                    } catch (Exception e) {
                        echo "Error executing SQL query to Mongo DB:"
                        echo "Error exception message: ${e.message}"
                        echo "Error exception: ${e}"
                    }

                    try {
                        echo "JENKINS_IMAGE_REDIS: ${JENKINS_IMAGE_REDIS}"
                        echo "JENKINS_CONTAINER_REDIS: ${JENKINS_CONTAINER_REDIS}"
                        def sql = "redis-cli && echo 'PING successful' || echo 'PING failed'"
                        echo "SQL: ${sql}"
                        def result = sh(script: "docker exec -i ${JENKINS_CONTAINER_REDIS} sh -c '${sql}'",
                                             returnStdout: true).trim()
                        echo "result: ${result}"
                        if (result == "PING") {
                            echo "Redis connection successful"
                        } else {
                            echo "Redis connection failed"
                        }
                    } catch (Exception e) {
                        echo "Error executing Redis command:"
                        echo "Error exception message: ${e.message}"
                        echo "Error exception: ${e}"
                    }
                }

                sh 'make jenkins_php_db_create_test'
            }
        }
        stage('PHP check linters') {
            when {
                expression {
                    def value = params.PHP_LINTERS
                    echo "PHP_LINTERS = ${value}"

                    return value == "true"
                }
            }
            steps {
                sh 'id'
                script {
                    if (fileExists('./www/back/composer.json')) {
                        dir('./www/back') {
                            sh 'ls -ld vendor'
                            sh 'composer cache-clear-dev'
                            sh 'composer check-cs'
                            sh 'composer check-stan'
                            sh 'composer check-phpmd'
                            sh 'composer check-psalm-no-cache'
                        }
                    } else {
                        error './www/back/composer.json not found'
                    }
                }
            }
        }
        stage('PHP check unit tests') {
            when {
                expression {
                    def value = params.PHP_TESTS_UNIT
                    echo "PHP_TESTS_UNIT = ${value}"

                    return value == "true"
                }
            }
            steps {
                sh 'id'
                script {
                    if (fileExists('./www/back/phpunit.xml')) {
                        dir('./www/back') {
                            sh 'ls -la public'
                            sh 'composer check-phpunit-unit-coverage'
                        }
                    } else {
                        error './www/back/phpunit.xml not found'
                    }
                }
            }
        }
        stage('PHP check integration tests') {
            when {
                expression {
                    def value = params.PHP_TESTS_INTEGRATION
                    echo "PHP_TESTS_INTEGRATION = ${value}"

                    return value == "true"
                }
            }
            steps {
                sh 'id'
                script {
                    if (fileExists('./www/back/phpunit.xml')) {
                        dir('./www/back') {
                            sh 'composer check-phpunit-integration-coverage'
                        }
                    } else {
                        error './www/back/phpunit.xml not found'
                    }
                }
            }
        }
        stage('PHP check functional tests') {
            when {
                expression {
                    def value = params.PHP_TESTS_FUNCTIONAL
                    echo "PHP_TESTS_FUNCTIONAL = ${value}"

                    return value == "true"
                }
            }
            steps {
                sh 'id'
                script {
                    if (fileExists('./www/back/phpunit.xml')) {
                        dir('./www/back') {
                            sh 'composer check-phpunit-functional-coverage'
                        }
                    } else {
                        error './www/back/phpunit.xml not found'
                    }
                }
            }
        }
        stage('SonarQube Analysis') {
            when {
                expression {
                    def value = params.PHP_SONARQUBE
                    echo "PHP_SONARQUBE = ${value}"

                    return value == "true"
                }
            }
            steps {
                sh 'id'
                script {
                    def scannerStatus = sh(returnStatus: true, script: "docker inspect -f '{{.State.Running}}' " +
                                            "${SONAR_CONTAINER_SCANNER_START}").toString().trim()
                    if (scannerStatus != 'true') {
                        echo "Sonar scanner container ${SONAR_CONTAINER_SCANNER_START} - is not running"
//                         sh "docker start ${SONAR_CONTAINER_SCANNER_START}"
                    }
//                  Проверяем наличие файла ./www/back/sonar-project.properties в контейнере агенте Jenkins
                    if (fileExists('./www/back/sonar-project.properties')) {
//                          Тома для монтирования Docker будут монтировать путь от хост-компьютера,
//                      а не от контейнера агенте Jenkins.
//                          Только абсолютный путь к папке на хост-машине, который будет смонтирован
//                      в контейнер sonar scanner.
                        def sonarBaseDir = BASE_DIR
                        echo 'sonarBaseDir = ' + sonarBaseDir
                        def sonarCacheDir = sonarBaseDir + '/var/check/sonar'
                        echo 'sonarCacheDir = ' + sonarCacheDir

//                      sh "docker stop ${SONAR_CONTAINER_SCANNER_RUN}"
                        sh "docker rm -f ${SONAR_CONTAINER_SCANNER_RUN}"
//                      sh "docker run --rm --network=loc_service_sonar_backend_net " +
                        sh "docker run -itd --network=loc_service_sonar_backend_net " +
                              "--name ${SONAR_CONTAINER_SCANNER_RUN} " +
                              "-v ${sonarBaseDir}:${SONAR_PROJECT_BASE_DIR} " +
                              "-v ${sonarCacheDir}/scannerwork:/usr/src/.scannerwork " +
                              "-v ${sonarCacheDir}/log:/usr/src/log " +
                              "-v ${sonarCacheDir}/cache:/opt/sonar-scanner/.sonar/cache " +
                              "-v ${sonarCacheDir}/conf:/opt/sonar-scanner/conf " +
                              "-w ${SONAR_PROJECT_BASE_DIR} " +
                              "sonarsource/sonar-scanner-cli:latest " +
                              "sonar-scanner -X " +
//                          При запуске сканера SonarQube с использованием файла sonar-project.properties и
//                      опций командной строки, параметры из командной строки имеют приоритет над
//                      параметрами из файла sonar-project.properties.
//                          То есть, если параметр sonar.working.directory указан как в файле
//                      sonar-project.properties, так и в опциях командной строки -Dsonar.working.directory,
//                      то будет использовано значение из опций командной строки.
                              "-Dsonar.projectBaseDir=${SONAR_PROJECT_BASE_DIR} " +
                              "-Dsonar.projectKey=${SONAR_PROJECT_KEY} " +
                              "-Dsonar.host.url=${SONAR_PROJECT_BASE_URL} " +
                              "-Dsonar.working.directory=/usr/src/.scannerwork " +
                              "-Dsonar.log.dir=/usr/src/log " +
                              "-Dsonar.token=${SONAR_PROJECT_TOKEN} "
                        sh "docker exec ${SONAR_CONTAINER_SCANNER_RUN} id"
                        sh "docker exec ${SONAR_CONTAINER_SCANNER_RUN} pwd"
//                         sh "docker exec ${SONAR_CONTAINER_SCANNER_RUN} ls -la /usr"
//                         sh "docker exec ${SONAR_CONTAINER_SCANNER_RUN} ls -la /usr/src"
//                         sh "docker exec ${SONAR_CONTAINER_SCANNER_RUN} ls -la /usr/src/log"
//                         sh "docker exec ${SONAR_CONTAINER_SCANNER_RUN} ls -la /usr/src/.scannerwork"
//                         sh "docker exec ${SONAR_CONTAINER_SCANNER_RUN} ls -la ${SONAR_PROJECT_BASE_DIR}"
//                         sh "docker exec ${SONAR_CONTAINER_SCANNER_RUN} ls -ld ${SONAR_PROJECT_BASE_DIR}/sonar-project.properties"
//                         sh "docker inspect ${SONAR_CONTAINER_SCANNER_RUN} | sed -n '/\"Mounts\":/ , /]/p'"
//                         sh "docker logs ${SONAR_CONTAINER_SCANNER_RUN}"
                    }
                }
            }
        }
    }
    post {
        always {
            script {
                if (params.PHP_TESTS_INTEGRATION == "true" || params.PHP_TESTS_FUNCTIONAL == "true") {
                    echo 'Cleaning up containers: DB MySQL, MongoDB, Redis ...'

                    def containerMysqlExists = sh(script: "docker ps -aqf name=${JENKINS_CONTAINER_MYSQL}", returnStatus: true) == 0
                    if (containerMysqlExists) {
                        echo "Container ${JENKINS_CONTAINER_MYSQL} - exists, stopping and removing container"
                        sh "docker stop ${JENKINS_CONTAINER_MYSQL}"
                        sh "docker rm -f ${JENKINS_CONTAINER_MYSQL}"
                    } else {
                        echo "Container ${JENKINS_CONTAINER_MYSQL} does not exist"
                    }

                    def containerMongoExists = sh(script: "docker ps -aqf name=${JENKINS_CONTAINER_MONGO}", returnStatus: true) == 0
                    if (containerMongoExists) {
                        echo "Container ${JENKINS_CONTAINER_MONGO} - exists, stopping and removing container"
                        sh "docker stop ${JENKINS_CONTAINER_MONGO}"
                        sh "docker rm -f ${JENKINS_CONTAINER_MONGO}"
                    } else {
                        echo "Container ${JENKINS_CONTAINER_MONGO} does not exist"
                    }

                    def containerRedisExists = sh(script: "docker ps -aqf name=${JENKINS_CONTAINER_REDIS}", returnStatus: true) == 0
                    if (containerRedisExists) {
                        echo "Container ${JENKINS_CONTAINER_REDIS} - exists, stopping and removing container"
                        sh "docker stop ${JENKINS_CONTAINER_REDIS}"
                        sh "docker rm -f ${JENKINS_CONTAINER_REDIS}"
                    } else {
                        echo "Container ${JENKINS_CONTAINER_REDIS} does not exist"
                    }
                }

                if (POST_PUBLISHING == true) {
                    echo 'Publishing Code Coverage Report in HTML ...'

                    dir('./www/back/var/check/tests') {
                        if (params.PHP_TESTS_UNIT == "true") {
                            publishHTML(target: [
                                allowMissing: false,
                                alwaysLinkToLastBuild: true,
                                keepAll: true,
                                reportDir: 'unit',
                                reportFiles: 'index.html',
                                reportName: 'Code Coverage Report for PHP unit tests',
                                reportTitles: 'Code Coverage Report for PHP unit tests'
                            ])
                        }
                        if (params.PHP_TESTS_INTEGRATION == "true") {
                            publishHTML(target: [
                                allowMissing: false,
                                alwaysLinkToLastBuild: true,
                                keepAll: true,
                                reportDir: 'integration',
                                reportFiles: 'index.html',
                                reportName: 'Code Coverage Report for PHP integration tests',
                                reportTitles: 'Code Coverage Report for PHP integration tests'
                            ])
                        }
                        if (params.PHP_TESTS_FUNCTIONAL == "true") {
                            publishHTML(target: [
                                allowMissing: false,
                                alwaysLinkToLastBuild: true,
                                keepAll: true,
                                reportDir: 'functional',
                                reportFiles: 'index.html',
                                reportName: 'Code Coverage Report for PHP functional tests',
                                reportTitles: 'Code Coverage Report for PHP functional tests'
                            ])
                        }
                    }
                }

                if (POST_CLOVER_REPORTINT == true) {
                    echo 'Clover reporting...'

                    dir('./www/back/var/check/tests') {
                        sh 'ls -la unit'
                        clover(
                            cloverReportDir: 'unit',
                            cloverReportFileName: 'phpunit.clover.xml',
                            // optional, default is: method=70, conditional=80, statement=80
                            healthyTarget: [methodCoverage: 70, conditionalCoverage: 80, statementCoverage: 80],
                            // optional, default is none
                            unhealthyTarget: [methodCoverage: 50, conditionalCoverage: 50, statementCoverage: 50],
                            // optional, default is none
                            failingTarget: [methodCoverage: 0, conditionalCoverage: 0, statementCoverage: 0]
                        )
                        sh 'ls -la integration'
                        clover(
                            cloverReportDir: 'integration',
                            cloverReportFileName: 'phpunit.clover.xml',
                            // optional, default is: method=70, conditional=80, statement=80
                            healthyTarget: [methodCoverage: 70, conditionalCoverage: 80, statementCoverage: 80],
                            // optional, default is none
                            unhealthyTarget: [methodCoverage: 50, conditionalCoverage: 50, statementCoverage: 50],
                            // optional, default is none
                            failingTarget: [methodCoverage: 0, conditionalCoverage: 0, statementCoverage: 0]
                        )
                        sh 'ls -la functional'
                        clover(
                            cloverReportDir: 'functional',
                            cloverReportFileName: 'phpunit.clover.xml',
                            // optional, default is: method=70, conditional=80, statement=80
                            healthyTarget: [methodCoverage: 70, conditionalCoverage: 80, statementCoverage: 80],
                            // optional, default is none
                            unhealthyTarget: [methodCoverage: 50, conditionalCoverage: 50, statementCoverage: 50],
                            // optional, default is none
                            failingTarget: [methodCoverage: 0, conditionalCoverage: 0, statementCoverage: 0]
                        )
                    }
                }

                if (POST_ALLURE_REPORTINT == true) {
                    echo 'Allure reporting...'

                    dir('./www/back/var/check/tests') {
                        allure([
                            includeProperties: false,
                            jdk: '',
                            properties: [],
                            reportBuildPolicy: 'ALWAYS',
                            results: [[path: 'allure-results']]
                        ])
                    }
                }

                if (POST_EMAIL_SENDING == true) {
                    echo 'Email sending...'

                    emailext subject: 'Jenkins Build Notification',
                          body: 'Build finished. Check console output here: ${BUILD_URL}',
                          to: 'scorpion3dd@gmail.com'
                }

                def buildNumber = currentBuild.number
                def stepsCount = currentBuild.rawBuild.getActions().size()
                def currentBuildDuration = currentBuild.duration
                def formattedDuration = formatDuration(currentBuildDuration)
                def description = "<b>Build:</b> "
                def result
                if (currentBuild.result == 'SUCCESS') {
                    printToConsole("Build was successful", buildNumber, stepsCount, formattedDuration)
                    result = "<b><span style=\"color:green;\">SUCCESS</span></b>"
                } else {
                    printToConsole("Build failed", buildNumber, stepsCount, formattedDuration)
                    result = "<b><span style=\"color:red;\">FAILED</span></b>"
                }
                description = "${description} ${result}" +
                            "<br>build #${buildNumber}:" +
                            "<br>- number of steps: ${stepsCount}" +
                            "<br>- duration: ${formattedDuration}"
                echo "PHP_SONARQUBE = ${params.PHP_SONARQUBE}"
                if (params.PHP_SONARQUBE == "true") {
                    def url = "${SONAR_PROJECT_BASE_URL}/dashboard?id=${SONAR_PROJECT_KEY}"
                    def text = "SonarQube Analysis Results"
                    def listener = currentBuild.rawBuild.getListener()
                    listener.hyperlink(url, "To view ${text} click to this link")
                    description = "${description} " +
                                "<br><a href=\"${url}\" target=\"_blank\">${text}</a>"
                }
                currentBuild.setDescription(description)
            }
        }
    }
}

def printToConsole(message, buildNumber, stepsCount, formattedDuration) {
    println("Post-build action for build #$buildNumber: $message")
    println("Number of build steps: $stepsCount")
    println("Build duration: ${formattedDuration}")
}

String formatDuration(long duration) {
    def seconds = TimeUnit.MILLISECONDS.toSeconds(duration)
    def ms = duration % 1000
    def result = ""

    if (seconds >= 3600) {
        def hours = TimeUnit.SECONDS.toHours(seconds)
        seconds -= hours * 3600
        result += "${hours} h "
    }

    if (seconds >= 60) {
        def minutes = TimeUnit.SECONDS.toMinutes(seconds)
        seconds -= minutes * 60
        result += "${minutes} min "
    }

    if (seconds > 0 || (seconds == 0 && ms > 0)) {
        result += "${seconds} sec "
    }

    if (seconds == 0 && ms > 0) {
        result += "${ms} ms"
    }

    return result.trim()
}
