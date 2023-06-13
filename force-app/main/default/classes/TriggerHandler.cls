/**
 * Simple TriggerHandler Framework
 */
public virtual class TriggerHandler {
    protected Boolean isExecuting     = Trigger.isExecuting;
    protected Boolean isInsert        = Trigger.isInsert;
    protected Boolean isUpdate        = Trigger.isUpdate;
    protected Boolean isDelete        = Trigger.isDelete;
    protected Boolean isBefore        = Trigger.isBefore;
    protected Boolean isAfter         = Trigger.isAfter;
    protected Boolean isUndelete      = Trigger.isUndelete;
    protected List<SObject> newList   = Trigger.new;
    protected Map<Id, SObject> newMap = Trigger.newMap;
    protected List<SObject> oldList   = Trigger.old;
    protected Map<Id, SObject> oldMap = Trigger.oldMap;
    protected Integer size            = Trigger.size;

    public void run() {
        if(isBefore && isInsert) {
            this.beforeInsert();
        } else if(isBefore && isUpdate) {
            this.beforeUpdate();
        } else if(isBefore && isDelete) {
            this.beforeDelete();
        } else if(isAfter && isInsert) {
            this.afterInsert();
        } else if(isAfter && isUpdate) {
            this.afterUpdate();
        } else if(isAfter && isDelete) {
            this.afterDelete();
        } else if(isAfter && isUndelete) {
            this.afterUndelete();
        }
    }

    public virtual void beforeInsert(){}

    public virtual void beforeUpdate(){}

    public virtual void beforeDelete(){}

    public virtual void afterInsert(){}

    public virtual void afterUpdate(){}

    public virtual void afterDelete(){}

    public virtual void afterUndelete(){}
}