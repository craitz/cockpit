source ./vars.sh

COUNT=0
for F in $(cat -et ${BASE_SERVICE_UPDATE_LIST}) ; do
    cd ${FILES_PATH}/${F//^M$}
    serverless deploy
    ((COUNT++))
done

echo "-- $COUNT lambdas implantados --"
