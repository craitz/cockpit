source ./vars.sh

echo > ${GLOBAL_SCRIPTS_PATH}/deploy-all.out

# printa o título com a data
PRINT_TITLE() {
    echo
    echo "${MAGENTA}***************************************************************************************"
    echo "${START_TITLE}"
    echo "***************************************************************************************${COLOR_RESET}"
    echo
}

# retira a mensagem de erro do output
STRIP_ERROR_MESSAGE() {
    RESULT=$1
    ERROR_SEARCH_STRING="---------------------------------------"
    STRIP_FRONT=${RESULT#*$ERROR_SEARCH_STRING}
    STRIP_BACK=${STRIP_FRONT%%$ERROR_SEARCH_STRING*}
    echo ${STRIP_BACK} > ${GLOBAL_SCRIPTS_PATH}/tmp.txt
    MESSAGE=$(sed $'s/[^[:print:]\t]//g' ${GLOBAL_SCRIPTS_PATH}/tmp.txt)
    echo -e "${RED}Serverless Error: ${MESSAGE}${COLOR_RESET}"
}

# mostra a mensagem adequada de acordo com o retorno do deploy
DISCOVER_MESSAGE_TO_SHOW() {
    RESULT=$1
    if [[ ${RESULT} == *"Service files not changed"* ]]; then
        echo -e "${YELLOW}Service files not changed. Skipping deployment...${COLOR_RESET}"
    elif [[ ${RESULT} == *"Serverless Error"* ]]; then
        STRIP_ERROR_MESSAGE "${RESULT}"
    else
        echo -e "${GREEN}Lambda ${FILE//^M$} successfuly deployed${COLOR_RESET}"
    fi
}

# função principal
MAIN() {
    # printa o título com a data
    PRINT_TITLE

    # contador total de arquivos
    COUNT_FILES=0

    # percorre todas as APIs
    for API_NAME in ${API_LIST[@]} ; do
        
        # contador de arquivos da API corrente
        COUNT=0

        # monta nome do arquivo com os nomes dos lambdas da API corrente
        eval UPDATE_LIST="${API_NAME}_BASESERVICE_UPDATE_LIST"
        
        # printa nome da API
        echo -e "${BLACK}${ONMAGENTA}  <API ${API_NAME}>  ${COLOR_RESET}"
        echo

        # percorre a API corrente
        for FILE in $(cat -et ${!UPDATE_LIST}) ; do
            
            # monta o caminho do arquivp corrente
            eval FILES_PATH="${API_NAME}_FILES_PATH"
            
            # incrementa o contador total de arquivos
            ((COUNT_FILES++))

            # move para o diretório do arquivo corrente
            cd ${!FILES_PATH}/${FILE//^M$}

            # printa o o nome do arquivo na tela
            echo -e "${COUNT_FILES}.${FILE//^M$}"

            # executa o deploy e atribui à variável RESULT
            RESULT="$(serverless deploy)"

            # mostra a mensagem adequada de acordo com o retorno do deploy
            DISCOVER_MESSAGE_TO_SHOW "${RESULT}"
            
            # anexa o retorno corrente no arquivo de output
            echo      
            echo ${RESULT} >> ${GLOBAL_SCRIPTS_PATH}/deploy-all.out

            # incrementa o contador de arquivos da API
            ((COUNT++))
        done
    done
}

# executa função principal
MAIN