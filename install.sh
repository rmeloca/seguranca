#!/bin/bash

#proxy
sudo dnf install squid
cp ./squid.conf /etc/squid/

#HIDS
wget https://bintray.com/artifact/download/ossec/ossec-hids/ossec-hids-2.8.3.tar.gz
tar zxf ossec-hids-2.8.3.tar.gz
cd ossec-hids-2.8.3
./install.sh

#configurações
#tipo de instalação: 'local'
#local de instalação: "/var/ossec"
#notificações por e-mail: "n"
#sistema de verificação de integridade: "s"
#sistema de detecção de rootkis: "s"
#sistema de respostas automaticas: "s"
#habilitar firewall-drop: "s"
#endereços não bloqueados: 172.16.255.202; 8.8.8.8; 10.255.142.2/24; 10.255.142.3/24

#vi /var/ossec/etc/ossec.conf
#<syscheck>: "<alert_new_files>yes</alert_new_files>"

#<directories>: "/home/raiz"
#report_changes="yes"

#local_rules.xml
#<rule id="554" level="0">
#<category>ossec</category>
#<decoded_as>syscheck_new_entry</decoded_as>
#<description>File added to the system.</description>
#<group>syscheck,</group>
#</rule>