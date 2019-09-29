source ../vars.sh

COUNT=0
for API_NAME in ${API_LIST[@]} ; do
    eval FILES_PATH="${API_NAME}_FILES_PATH"
    
    echo "cp ${SERVERLESS_VARIABLES_PATH} ${!FILES_PATH}"
    cp ${SERVERLESS_VARIABLES_PATH} ${!FILES_PATH}
    
    ((COUNT++))
done

echo "-- $COUNT APIs atualizadas --"

