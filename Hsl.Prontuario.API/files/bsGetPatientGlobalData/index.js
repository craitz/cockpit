const base = require('./base-service/base-service.js');

exports.handler = async(event, context) => {
    try {
        base.start(event, context);

        const patientId = base.assertRequiredValue('patientId', event.patientId, 'number');


        return {
            diagnosis: [{
                cidId: 123456,
                cidName: 'Diagnóstico 1',
                cidVersion: 1,
                cidStartedIn: (new Date()).toLocaleDateString(),
                cidEndedIn: (new Date()).toLocaleDateString(),
                cidConfirmationStatus: base.enums.cidConfirmationStatus.CONFIRMADO,
                doctorClassification: base.enums.doctorClassification.ACTUAL_PROBLEM
            }],
            medication: [{
                medicationID: 7890,
                medicationName: 'Droflex',
                medicationVia: {
                    medicationViaID: 1,
                    medicationViaName: 'Nome da via do medicamento'
                },
                medicationPosology: 'posologia',
                medicationAmount: 'amount',
                medicationContinuousUsage: true,
                doctorClassification: base.enums.doctorClassification.ACTUAL_PROBLEM
            }],
            socialHabit: [{
                socialHabitID: 3456,
                socialHabitName: 'tabagismo',
                doctorClassification: base.enums.doctorClassification.ACTUAL_PROBLEM
            }],
            allergy: [{
                allergyID: 6789,
                allergyName: 'Rinite',
                doctorClassification: base.enums.doctorClassification.ACTUAL_PROBLEM
            }],
            clinicalBackground: [{
                clinicalBackgroundID: 2468,
                clinicalBackgroundName: 'histório clínico',
                doctorClassification: base.enums.doctorClassification.ACTUAL_PROBLEM
            }],
            surgicalBackground: [{
                surgicalBackgroundID: 43260,
                surgicalBackgroundName: 'histórico cirúrgico',
                doctorClassification: base.enums.doctorClassification.ACTUAL_PROBLEM
            }],
            familyBackground: [{
                familyBackgroundID: 83546,
                familyBackgroundName: 'histórico familiar',
                doctorClassification: base.enums.doctorClassification.ACTUAL_PROBLEM
            }],
            vaccinesBackground: [{
                vaccineID: 9780021,
                vaccineName: 'histórico de vacinação',
                doctorClassification: base.enums.doctorClassification.ACTUAL_PROBLEM
            }],
            patientDescription: 'descrição do paciente',
            examResultList: [{
                examID: 664352,
                examName: 'tomografia computadorizada',
                examDate: (new Date()).toLocaleDateString(),
                examNote: (new Date()).toLocaleDateString()
            }]
        }
    } catch (error) {
        base.handleError(err);
    } finally {
        base.end();
    }
};

// alterações
// DoctorClassification -> doctorClassification
// Diagnosis -> diagnosis
// Medication -> medication