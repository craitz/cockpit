//S3
const s3Lib = require('aws-sdk/clients/s3');
const s3 = new s3Lib();

// Constantes
const _enums = {
    statusCodes: require('./enums/status-code.json'),
    maritalStatus: require('./enums/marital-status.json'),
    cidConfirmationStatus: require('./enums/cid-confirmation-status.json'),
    doctorClassification: require('./enums/doctor-classification.json'),
}

let functionName;
let env;

function _log(message) {
    if (env === 'DEV') {
        console.log(message);
    }
}

function _infoLog(message) {
    if (env === 'DEV') {
        console.info(message);
    }
}

function _errorLog(message) {
    console.error(message);
}


function _toInteger(parsingKey, parsingValue) {
    return Number(parsingValue, 10);
}

function _customError(errorType, httpStatus, statusCode = 0, cause = 'Erro tratado pelo sistema', custom = true) {
    return {
        errorType,
        httpStatus,
        statusCode,
        cause,
        custom
    };
}

function _handleError(err) {
    if (err && (typeof err === 'string')) {
        throw err;
    }

    if (err && err.custom && err.custom === true) {
        const strError = JSON.stringify(err);

        _errorLog({
            err: strError
        });

        throw strError;
    } else {
        const strError = JSON.stringify(_customError('InternalServerError', 500, (_enums.statusCodes &&
            _enums.statusCodes.error) || 14, err.message || err.cause, false));

        _errorLog({
            err: strError
        });

        throw strError;
    }
}

function _assertRequiredValue(key, value, type) {
    if (value === undefined || value === null) {
        throw _customError('BadRequest', 400, _enums.statusCodes.parameterNotInformed, `parâmetro não informado [${key}]`);
    }

    if (type !== typeof value) {
        if (type === 'number') {
            if (typeof value === 'string') {
                if (value.trim().length === 0) {
                    throw _customError('BadRequest', 400, _enums.statusCodes.parameterNotInformed, `parâmetro não informado [${key}]`);
                }

                if (isNaN(value)) {
                    throw _customError('BadRequest', 400, _enums.statusCodes.invalidParameter, `parâmetro inválido [${key}]`);
                }

                return Number(value);
            }
        } else if (type === 'string') {
            return value.toString();
        } else {
            throw _customError('BadRequest', 400, _enums.statusCodes.invalidParameter, `parâmetro inválido [${key}]`);
        }
    }

    if (typeof value === 'string' && value.trim().length === 0) {
        _infoLog({
            valueFim: value || 'NONE'
        });
        throw _customError('BadRequest', 400, _enums.statusCodes.parameterNotInformed, `parâmetro não informado [${key}]`);
    }

    return value;
}

function _getS3Object(Bucket, Key) {
    return new Promise((resolve, reject) => {
        _infoLog({
            Call_GetS3Object: {
                Bucket,
                Key
            }
        });
        s3.getObject({
            Bucket,
            Key
        }, (err, data) => {
            if (err) {
                _errorLog({
                    Erro_GetS3Object: err
                });

                reject(_customError('InternalServerError', 500, _enums.statusCodes.errorLoadingInfo, err.message));
            } else {
                resolve(JSON.parse(data.Body.toString()));
            }
        });
    });
}

function _start(event, context) {
    env = event.env;
    functionName = `${context.functionName}:${env}:${context.functionVersion}`;

    _log(`START> ${functionName}`);
}

function _end() {
    _log(`END> ${functionName}`);
}

module.exports = {
    enums: _enums,
    log: _log,
    infoLog: _infoLog,
    errorLog: _errorLog,
    toInteger: _toInteger,
    customError: _customError,
    handleError: _handleError,
    assertRequiredValue: _assertRequiredValue,
    getS3Object: _getS3Object,
    start: _start,
    end: _end
};