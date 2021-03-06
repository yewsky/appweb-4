/*
    Denial of service testing
 */

const HTTP: Uri = App.config.uris.http || "127.0.0.1:4100"

//  Check server available
http = new Http
http.get(HTTP + "/index.html")
assert(http.status == 200)
http.close()

//  Try to crash with DOS attack
for (i in 2000) {
    let s = new Socket
    s.connect(HTTP.address)
    let written = s.write("Any Text")
    assert(written == 8)
    s.close()
}

//  Check server still there
http = new Http
http.get(HTTP + "/index.html")
assert(http.status == 200)
http.close()
