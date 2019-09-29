const base = require('./base-service/base-service.js');

exports.handler = async(event, context) => {
    try {
        base.start(event, context);

        const userId = base.assertRequiredValue('userId', event.userId, 'number');

        return {
            userId: 1,
            name: 'João da Silva',
            gender: 'M',
            maritalStatus: base.enums.maritalStatus.SOLTEIRO,
            birthDate: (new Date()).toLocaleDateString(),
            patientCPF: '63647042048',
            company: {
                id: 1,
                name: 'Bradesco'
            },
            master: {
                userId: 2,
                name: 'Roberto Siqueira',
                firstName: 'Roberto'
            }
        }
    } catch (error) {
        base.handleError(err);
    } finally {
        base.end();
    }
};