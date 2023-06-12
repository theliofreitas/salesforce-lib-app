trigger BorrowingTrigger on Borrowing__c (before insert) {
    new BorrowingTriggerHandler().run();
}