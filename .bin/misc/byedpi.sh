#!/bin/sh

#ciadpi --port 1080 --disorder 1 --fake 0 --ttl 1 -A torst --tlsrec 1+s --debug 1
ciadpi --port 1080 --debug 2 --ip 127.0.0.1 --oob 1 --split 2
