# Shpec Matchers for resty
restytest(){
    # Lance commande, vérifie bonne requete
    local n=$1
    local cmd=$2
    # lance commande, vérifie bon output

    echo eval resty-call $cmd > "/tmp/test$n"

    # §TODO: retrieve test

    # TODO: Launch server
    # netcat -l -w 2 -p 9090 -e './lilhttpd -I' localhost || break
   # grep '^# TEST [0-9][0-9]*' $TEST |head -$j |tail -1 |sed 's/^#/# [REQ]/'

    #netcat -l -w 2 -p 9090 -e ./lilhttpd localhost || break
    #grep '^# TEST [0-9][0-9]*' $TEST |head -$j |tail -1 |sed 's/^#/# [OUT]/'
  assert test true
}
# TOOD: use assert equal


restytest_cmd(){
    # command to be eval?
    assert test true
}
