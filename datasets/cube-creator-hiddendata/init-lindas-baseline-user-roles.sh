#!/bin/bash

# Database and user credentials
SERVER=https://data.zazuko.com:443
DB='lindas-cc-baseline'
# PASSWORD_PUBLIC='pass_public'

# Read out DB settings concerning 'query.all.graphs' and 'security.named.graphs'
stardog-admin --server $SERVER metadata get -o query.all.graphs -o security.named.graphs $DB -u admin

# Remove existing roles and users
# stardog-admin --server $SERVER user remove user_public -u admin

stardog-admin --server $SERVER role remove lindas-read-all -u admin

# Create roles
stardog-admin --server $SERVER role add lindas-read-all -u admin

# Create users with new passwords
# stardog-admin --server $SERVER user add user_public --new-password $PASSWORD_PUBLIC -u admin

# Grant read permissions to 'lindas-read-all' role
stardog-admin --server $SERVER role grant -a read -o "db:$DB" lindas-read-all -u admin
stardog-admin --server $SERVER role grant -a read -o "metadata:$DB" lindas-read-all -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB" lindas-read-all -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\tag:stardog:api:context:local" lindas-read-all -u admin

# Grant read permissions to 'authenticated' role (explicit permission for every named-graph)
stardog-admin --server $SERVER role grant -a read -o "db:$DB" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "metadata:$DB" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/elcom/electricityprice" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foca/cube" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/cube" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/gefahren-waldbrand-praeventionsmassnahmen-kantone" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/gefahren-waldbrand-warnung" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/hydro" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/nfi" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foph/covid19" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fsvo/animaldisease" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fsvo/rabies" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/cube" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfoe/cube" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/stadtzuerich/stat" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/nl/isil" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/didok" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/nova" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/setactual" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/constructionsite" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/meta" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/opendataswiss" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/stapfer_enquete" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/ontologies" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/themes" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/plazi" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://ld.stadt-zuerich.ch/statistics/view/" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/cube/dimension" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/egad/ric-o" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foj/zefix" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/territorial" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/staatskalender" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/rvov" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/lindas-ech" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/curia" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/zhch/elodzh" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/ais" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/orgs" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/popularvotes" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfao/politicalfunding" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfo/i14y" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fso/register" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foag/agricultural-market-data" authenticated -u admin


# Assign roles to users
stardog-admin --server $SERVER user addrole --role lindas-read-all user_public -u admin

# Echo
echo "Permissions of role 'lindas-read-all' ..."
stardog-admin --server $SERVER role permission lindas-read-all -u admin
