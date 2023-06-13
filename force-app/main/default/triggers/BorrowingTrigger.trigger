trigger BorrowingTrigger on Borrowing__c (after insert, after update) {
    new BorrowingTriggerHandler().run();
}