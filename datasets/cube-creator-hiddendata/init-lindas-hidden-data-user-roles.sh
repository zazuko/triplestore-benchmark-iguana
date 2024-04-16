#!/bin/bash

# Database and user credentials
SERVER=https://data.zazuko.com:443
DB='lindas-cc-hidden-data'
PASSWORD_PUBLIC='pass_public'
PASSWORD_AUTHENTICATED='pass_authenticated'

# Read out DB settings concerning 'query.all.graphs' and 'security.named.graphs'
stardog-admin --server $SERVER metadata get -o query.all.graphs -o security.named.graphs $DB -u admin

# Remove existing roles and users
stardog-admin --server $SERVER user remove user_public -u admin
stardog-admin --server $SERVER user remove user_authenticated -u admin

stardog-admin --server $SERVER role remove public -u admin
stardog-admin --server $SERVER role remove authenticated -u admin

# Create roles
stardog-admin --server $SERVER role add public -u admin
stardog-admin --server $SERVER role add authenticated -u admin

# Create users with new passwords
stardog-admin --server $SERVER user add user_public --new-password $PASSWORD_PUBLIC -u admin
stardog-admin --server $SERVER user add user_authenticated --new-password $PASSWORD_AUTHENTICATED -u admin

# Grant database-level read permissions to roles
stardog-admin --server $SERVER role grant -a read -o "db:$DB" public -u admin
stardog-admin --server $SERVER role grant -a read -o "db:$DB" authenticated -u admin

# Grant 'public' named-graphs read permissions to roles - named-graphs with cubes
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/elcom/electricityprice" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/elcom/electricityprice" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foca/cube" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foca/cube" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/cube" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/cube" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/gefahren-waldbrand-praeventionsmassnahmen-kantone" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/gefahren-waldbrand-praeventionsmassnahmen-kantone" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/gefahren-waldbrand-warnung" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/gefahren-waldbrand-warnung" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/hydro" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/hydro" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/nfi" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/nfi" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foph/covid19" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foph/covid19" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fsvo/animaldisease" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fsvo/animaldisease" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fsvo/rabies" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fsvo/rabies" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/cube" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/cube" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfoe/cube" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfoe/cube" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/stadtzuerich/stat" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/stadtzuerich/stat" authenticated -u admin

# Grant 'public' named-graphs read permissions to roles - other named-graphs without cubes
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/nl/isil" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/nl/isil" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/didok" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/didok" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/nova" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/nova" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/setactual" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/setactual" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/constructionsite" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sbb/constructionsite" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/meta" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/meta" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/opendataswiss" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/opendataswiss" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/stapfer_enquete" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/stapfer_enquete" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/ontologies" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/ontologies" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/themes" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/themes" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/plazi" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/plazi" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://ld.stadt-zuerich.ch/statistics/view/" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://ld.stadt-zuerich.ch/statistics/view/" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/cube/dimension" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/cube/dimension" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/egad/ric-o" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/egad/ric-o" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foj/zefix" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foj/zefix" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/territorial" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/territorial" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/staatskalender" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/staatskalender" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/rvov" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/rvov" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/lindas-ech" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/lindas-ech" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/curia" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/curia" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/zhch/elodzh" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/zhch/elodzh" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/ais" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfa/ais" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/orgs" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/orgs" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/popularvotes" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fch/popularvotes" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfao/politicalfunding" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfao/politicalfunding" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfo/i14y" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/sfo/i14y" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fso/register" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/fso/register" authenticated -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foag/agricultural-market-data" public -u admin
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foag/agricultural-market-data" authenticated -u admin


# Grant 'hidden' named-graphs read permissions to 'authenticated' role
stardog-admin --server $SERVER role grant -a read -o "named-graph:$DB\https://lindas.admin.ch/foen/cube/hidden" authenticated -u admin


# Replicate permissons from public@LINDAS
stardog-admin --server $SERVER role grant -a read -o "metadata:$DB" public -u admin
stardog-admin --server $SERVER role grant -a read -o "metadata:$DB" authenticated -u admin


# Assign roles to users
stardog-admin --server $SERVER user addrole --role public user_public -u admin
stardog-admin --server $SERVER user addrole --role authenticated user_authenticated -u admin

# Echo
echo "Permissions of role 'public' ..."
stardog-admin --server $SERVER role permission public -u admin

echo "Permissions of role 'authenticated' ..."
stardog-admin --server $SERVER role permission authenticated -u admin
