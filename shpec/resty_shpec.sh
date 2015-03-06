describe "Resty"

. ./resty -W # source resty with no history mode


# TODO Launch server
resty 127.0.0.1:9090 2> /dev/null


  it "handle basic GET request (1)"
    assert restytest 01 "GET /simple.html"
  end

  it "handle basic PUT request (2)"
    assert restytest 02 "PUT /simple.html 'here is some data'"
  end

  it "handle basic POST request (3)"
    assert restytest 03 "POST /simple.html 'here is some data'"
  end

  it "handle basic DELETE request (4)"
    assert restytest 04 "DELETE /simple.html"
  end

  it "handle basic TRACE request (5)"
    assert restytest 05 "TRACE /simple.html 'here is some data'"
  end

  it "handle basic OPTIONS request (6)"
    assert restytest 06 "OPTIONS /simple.html"
  end

  it "handle Raw response (7)"
    assert restytest 07 "GET /simple.html -Z"
  end

  it "handle Get headers too (8)"
    assert restytest 08 "GET /simple.html -v 2>&1"
  end

  it "handle POST with data sent in query string (9)"
    assert restytest 09 "POST /simple.html -d foo=bar -G"
  end

  it "handle POST with data sent in message body (10)"
    assert restytest 10 "POST /simple.html '{foo:  \"bar \"}'"
  end

  it "handle POST with extra header and basic auth, data in message body (11)"
    assert restytest 11 "POST /simple.html -u 'user:secret' -H 'Accept: application/json' < shpec/simple.json"
    # TODO: relative path
  end

  it "handle json pretty-print formatting (12)"
    assert restytest 12 "GET /simple.json | ../pp 2>/dev/null"
  end

resty 127.0.0.1:9090 -H "Accept: application/json" -u user:pass 2> /dev/null

  it "handle make sure the default options are correctly set (13)"
    assert restytest 11 "GET /simple.json"
  end

resty 127.0.0.1:9090 2> /dev/null

  it "handle make sure the default options are correctly unset (14)"
    assert restytest 14 "GET /simple.json"
  end

  it "handle try PUT with both data in body and query params in url, no urlencode (15)"
    assert restytest_cmd 15 "echo '{\"foo\":\"bar\"}' |PUT '/simple.json?param=value&other=blah' -Q"
  end

  it "handle try PUT with both data in body and query params in url via -q (16)"
    assert restytest_cmd 16 "echo '{\"foo\":\"bar\"}' |PUT '/simple.json' -q 'param=value&other=blah'"
# TOCHECK
  end

end
