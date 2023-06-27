public class Util {
    /**
     * Method to compare two maps of SObjects and return the records which one of the specified fields has changed.
     */
    public static Map<Id, SObject> getModifiedRecords(Map<Id, SObject> oldMap, Map<Id, SObject> newMap, String[] fields) {
        Map<Id, SObject> modifiedRecords = new Map<Id, SObject>();

        for (Id recordId : newMap.keySet()) {
            SObject oldRecord = oldMap.get(recordId);
            SObject newRecord = newMap.get(recordId); 

            if (oldRecord != null) {
                for (String field : fields) {
                    if (newRecord.get(field) != oldRecord.get(field)) {
                        modifiedRecords.put(recordId, newRecord);
                        break;
                    }
                }
            }
        }

        return modifiedRecords;
    }

    /**
     * Method to transform a List of Objects into a List of Strings.
     */
    public static List<String> parseObjectToString(List<Object> objectList) {
        List<String> stringList = new List<String>();

        for (Object obj : objectList) {
            stringList.add((String) obj);
        }

        return stringList;
    }
}