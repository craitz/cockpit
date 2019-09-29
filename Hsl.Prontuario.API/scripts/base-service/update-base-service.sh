source ../vars.sh

COUNT=0
for F in $(cat -et ${BASE_SERVICE_UPDATE_LIST}) ; do
    echo "copiando [${BASE_DIR_NAME}] para ${FILES_PATH}/${F//^M$}..."
    cp -r ${BASE_PATH} ${FILES_PATH}/${F//^M$}
    ((COUNT++))
done

echo "-- $COUNT lambdas atualizados --"
