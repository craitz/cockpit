ROOT_PATH="C:/Users/craitz/dev/cockpit"

# foregrounds
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

# backgrounds
ONBLACK=`tput setab 0`
ONRED=`tput setab 1`
ONGREEN=`tput setab 2`
ONYELLOW=`tput setab 3`
ONBLUE=`tput setab 4`
ONMAGENTA=`tput setab 5`
ONCYAN=`tput setab 6`
ONWHITE=`tput setab 7`

# Reset
COLOR_RESET="${WHITE}${ONBLACK}"

START_TITLE="DEPLOY ALL: $(date)"

GLOBALS_PATH="${ROOT_PATH}/globals"
GLOBALS_SCRIPTS_PATH="${GLOBALS_PATH}/scripts"

BASESERVICE_DIR_NAME="base-service"
GLOBAL_BASESERVICE_PATH="${GLOBALS_PATH}/libs/${BASESERVICE_DIR_NAME}"
GLOBAL_SCRIPTS_PATH="${GLOBALS_PATH}/scripts"

SERVERLESS_VARIABLES_FILENAME="variables.json"
SERVERLESS_VARIABLES_PATH="${GLOBAL_SCRIPTS_PATH}/serverless-variables/${SERVERLESS_VARIABLES_FILENAME}"

API_LIST=("AGENDA" "BUSCA" "PRONTUARIO")

AGENDA_PATH="${ROOT_PATH}/Hsl.Agenda.API"
AGENDA_FILES_PATH="${AGENDA_PATH}/files"
AGENDA_LIBS_PATH="${AGENDA_PATH}/libs"
AGENDA_SCRIPTS_PATH="${AGENDA_PATH}/scripts"
AGENDA_BASESERVICE_UPDATE_LIST="${GLOBALS_SCRIPTS_PATH}/all-files-agenda.txt"

BUSCA_PATH="${ROOT_PATH}/Hsl.Busca.API"
BUSCA_FILES_PATH="${BUSCA_PATH}/files"
BUSCA_LIBS_PATH="${BUSCA_PATH}/libs"
BUSCA_SCRIPTS_PATH="${BUSCA_PATH}/scripts"
BUSCA_BASESERVICE_UPDATE_LIST="${GLOBALS_SCRIPTS_PATH}/all-files-busca.txt"

PRONTUARIO_PATH="${ROOT_PATH}/Hsl.Prontuario.API"
PRONTUARIO_FILES_PATH="${PRONTUARIO_PATH}/files"
PRONTUARIO_LIBS_PATH="${PRONTUARIO_PATH}/libs"
PRONTUARIO_SCRIPTS_PATH="${PRONTUARIO_PATH}/scripts"
PRONTUARIO_BASESERVICE_UPDATE_LIST="${GLOBALS_SCRIPTS_PATH}/all-files-prontuario.txt"

# Reset
Color_Off='\033[0m'       # Text Reset

# # Regular Colors
# Black='\033[0;30m'        # Black
# Red='\033[0;31m'          # Red
# Green='\033[0;32m'        # Green
# Yellow='\033[0;33m'       # Yellow
# Blue='\033[0;34m'         # Blue
# Purple='\033[0;35m'       # Purple
# Cyan='\033[0;36m'         # Cyan
# White='\033[0;37m'        # White

# # Bold
# BBlack='\033[1;30m'       # Black
# BRed='\033[1;31m'         # Red
# BGreen='\033[1;32m'       # Green
# BYellow='\033[1;33m'      # Yellow
# BBlue='\033[1;34m'        # Blue
# BPurple='\033[1;35m'      # Purple
# BCyan='\033[1;36m'        # Cyan
# BWhite='\033[1;37m'       # White

# # Underline
# UBlack='\033[4;30m'       # Black
# URed='\033[4;31m'         # Red
# UGreen='\033[4;32m'       # Green
# UYellow='\033[4;33m'      # Yellow
# UBlue='\033[4;34m'        # Blue
# UPurple='\033[4;35m'      # Purple
# UCyan='\033[4;36m'        # Cyan
# UWhite='\033[4;37m'       # White

# # Background
# On_Black='\033[40m'       # Black
# On_Red='\033[41m'         # Red
# On_Green='\033[42m'       # Green
# On_Yellow='\033[43m'      # Yellow
# On_Blue='\033[44m'        # Blue
# On_Purple='\033[45m'      # Purple
# On_Cyan='\033[46m'        # Cyan
# On_White='\033[47m'       # White

# # High Intensity
# IBlack='\033[0;90m'       # Black
# IRed='\033[0;91m'         # Red
# IGreen='\033[0;92m'       # Green
# IYellow='\033[0;93m'      # Yellow
# IBlue='\033[0;94m'        # Blue
# IPurple='\033[0;95m'      # Purple
# ICyan='\033[0;96m'        # Cyan
# IWhite='\033[0;97m'       # White

# # Bold High Intensity
# BIBlack='\033[1;90m'      # Black
# BIRed='\033[1;91m'        # Red
# BIGreen='\033[1;92m'      # Green
# BIYellow='\033[1;93m'     # Yellow
# BIBlue='\033[1;94m'       # Blue
# BIPurple='\033[1;95m'     # Purple
# BICyan='\033[1;96m'       # Cyan
# BIWhite='\033[1;97m'      # White

# # High Intensity backgrounds
# On_IBlack='\033[0;100m'   # Black
# On_IRed='\033[0;101m'     # Red
# On_IGreen='\033[0;102m'   # Green
# On_IYellow='\033[0;103m'  # Yellow
# On_IBlue='\033[0;104m'    # Blue
# On_IPurple='\033[0;105m'  # Purple
# On_ICyan='\033[0;106m'    # Cyan
# On_IWhite='\033[0;107m'   # White