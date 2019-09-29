source ../vars.sh

COUNT=0
for F in $(cat -et ${BASE_SERVICE_UPDATE_LIST}) ; do
    echo "removendo [${BASE_DIR_NAME}] de ${FILES_PATH}/${F//^M$}..."
    rm -rf ${FILES_PATH}/${F//^M$}/${BASE_DIR_NAME}
    ((COUNT++))
done

echo "-- $COUNT lambdas atualizados --"

