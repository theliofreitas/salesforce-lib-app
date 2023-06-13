public class BorrowingTriggerHandler extends TriggerHandler {
    public override void afterInsert() {
        BorrowingHelper.updateBookCopyStatus(newList);
    }

    public override void afterUpdate() {
        BorrowingHelper.updateBookCopyStatus(newList);
    }
}