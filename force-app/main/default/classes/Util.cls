public class Util {
    /**
     * Method to compare two maps of SObjects and return only the modified records based on a specific field.
     */
    public static Map<Id, SObject> getModifiedRecords(Map<Id, SObject> oldMap, Map<Id, SObject> newMap, String fieldName) {
        Map<Id, SObject> modifiedRecords = new Map<Id, SObject>();

        for (Id recordId : newMap.keySet()) {
            SObject oldRecord = oldMap.get(recordId);
            SObject newRecord = newMap.get(recordId); 

            if (oldRecord != null) {
                if (newRecord.get(fieldName) != oldRecord.get(fieldName)) {
                    modifiedRecords.put(recordId, newRecord);
                }
            }
        }

        return modifiedRecords;
    }
}