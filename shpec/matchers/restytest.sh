# Shpec Matchers for resty
restytest(){
    # Lance commande, vérifie bonne requete
    local n=$1
    local cmd=$2
    # lance commande, vérifie bon output

    # TODO: captyire!!
    (
    echo eval resty-call $cmd > "/tmp/test$n"
    )&

    wait

    # compare when capture
    echo Compare request with $(ls shpec/data/test-$n-*.req)
    echo Compare output with $(ls shpec/data/test-$n-*.out)
    #TODO: relative

    # TODO: Launch server. see how?
    # netcat -l -w 2 -p 9090 -e './lilhttpd -I' localhost || break

    # grep '^# TEST [0-9][0-9]*' $TEST |head -$j |tail -1 |sed 's/^#/# [REQ]/'
    # grep '^# TEST [0-9][0-9]*' $TEST |head -$j |tail -1 |sed 's/^#/# [OUT]/'
  assert test true
}

restytest_cmd(){
    # command to be eval?
    assert test true
}
