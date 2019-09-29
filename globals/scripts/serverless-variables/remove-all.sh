source ../vars.sh

COUNT=0
for API_NAME in ${API_LIST[@]} ; do
    eval FILES_PATH="${API_NAME}_FILES_PATH"
    
    echo "rm -f ${!FILES_PATH}/${SERVERLESS_VARIABLES_FILENAME}"
    rm -rf ${!FILES_PATH}/${SERVERLESS_VARIABLES_FILENAME}
    
    ((COUNT++))
done

echo "-- $COUNT APIs atualizadas --"

