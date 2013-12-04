#!/usr/bin/env python

import sys
import BaseHTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler

HandlerClass = SimpleHTTPRequestHandler
ServerClass  = BaseHTTPServer.HTTPServer
Protocol     = "HTTP/1.0"

if len(sys.argv) > 1:
    port = int(sys.argv[1])
else:
    port = 8000

if len(sys.argv) > 2:
    server = sys.argv[2]
else:
    server = '127.0.0.1'

server_address = (server, port)

HandlerClass.protocol_version = Protocol
httpd = ServerClass(server_address, HandlerClass)

sa = httpd.socket.getsockname()
print "Serving HTTP on", sa[0], "port", sa[1], "..."
httpd.serve_forever()
