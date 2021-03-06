from  olv_dialog_controller import OlvDialogController
from assessment_measurements import AssessmentMeasurements
from assessment_session import AssessmentSession
from sqlalchemy import desc
from sqlalchemy import and_
from sqlalchemy import func
from datetime import datetime

class AssessmentMeasurementsController(OlvDialogController):
    """
    Controller class for Assessment Measurements Dialogs which performs various queries,
    adds, updates, and deletes records from a database table. 
    The class extends the OlvDialogController class. 
    Methods:
        getAllByPatientByWoundByExpForOLView(patientId,woundId,experimentId) - Gets all records for a patient/wound/experiment
    """
    
    def getAllByPatientByWoundByExpForOLView(self, patientId, woundId, experimentId):
        """
        Gets all records by a patient
        """
        result = self.db.session.query(AssessmentMeasurements).join(AssessmentSession, AssessmentMeasurements.session_id == AssessmentSession.id).filter(and_(AssessmentSession.patient_id == patientId, AssessmentSession.wound_id == woundId, AssessmentMeasurements.experiment_id == experimentId)).order_by(desc(AssessmentSession.assessment_id)).all()
        olvResults = self.convertResults(result)
        return olvResults

    def getByPatientByWoundByNoByExp(self, patientId, woundId, assessmentId, experimentId):
        """
        Gets record for a patient, wound, and assessment
        """
        assessment = self.db.session.query(AssessmentMeasurements).join(AssessmentSession, AssessmentMeasurements.session_id == AssessmentSession.id).filter(and_(AssessmentSession.patient_id == patientId, AssessmentSession.wound_id == woundId, AssessmentSession.assessment_id == assessmentId, AssessmentMeasurements.experiment_id == experimentId)).first()
        return assessment
