trigger BorrowingTrigger on Borrowing__c (after insert, after update, after delete) {
    new BorrowingTriggerHandler().run();
}