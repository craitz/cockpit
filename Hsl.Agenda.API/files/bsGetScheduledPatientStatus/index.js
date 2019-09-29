const base = require('./base-service/base-service.js.js.js');

exports.handler = async(event, context) => {
    try {
        base.start(event, context);

        const doctorId = base.assertRequiredValue('doctorId', event.doctorId, 'number');
        const date = base.assertRequiredValue('date', event.date, 'string');

        return {
            appointmentId: 1,
            startTime: (new Date()).toLocaleString(),
            endTime: (new Date()).toLocaleString(),
            patients: [{
                    id: 1,
                    name: 'João da Silva'
                },
                {
                    id: 2,
                    name: 'Maria das Dores'
                },
                {
                    id: 3,
                    name: 'José de Oliveira'
                }
            ]
        }
    } catch (error) {
        base.handleError(err);
    } finally {
        base.end();
    }
};

// ALTERAÇÕES
// 1. Patient -> patients (object p/ array)