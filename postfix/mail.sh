#!/bin/bash

useradd -c 'matheus' -m -s /bin/false alcivan
echo "matheus:123456"|chpasswd

useradd -c 'sales' -m -s /bin/false sales
echo "sales:123456"|chpasswd