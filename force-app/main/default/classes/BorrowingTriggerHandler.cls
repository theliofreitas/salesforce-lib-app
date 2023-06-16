public class BorrowingTriggerHandler extends TriggerHandler {
    public override void afterInsert() {
        // BorrowingHelper.updateBookCopyStatus(newList);
    }

    public override void afterUpdate() {
        String[] fields = new String[] {'Status__c', 'Devolution_Status__c'};
        BorrowingHelper.updateBookCopyStatus(Util.getModifiedRecords(oldMap, newMap, fields));
    }
}