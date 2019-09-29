source ../vars.sh

for API_NAME in ${API_LIST[@]} ; do
    COUNT=0
    eval UPDATE_LIST="${API_NAME}_BASESERVICE_UPDATE_LIST"
    
    for FILE in $(cat -et ${!UPDATE_LIST}) ; do
        eval FILES_PATH="${API_NAME}_FILES_PATH"
        
        echo "rm -rf ${!FILES_PATH}/${FILE//^M$}/${BASESERVICE_DIR_NAME}"
        rm -rf ${!FILES_PATH}/${FILE//^M$}/${BASESERVICE_DIR_NAME}
        
        ((COUNT++))
    done

    echo "-- $COUNT lambdas atualizados em [${API_NAME}] --"
    echo
done

