public class BorrowingTriggerHandler extends TriggerHandler {
    public override void beforeInsert() {
        System.debug(newList);
    }
}