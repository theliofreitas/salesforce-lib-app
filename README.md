# Salesforce Library App

> A Salesforce org designed for library management. ☁

## About

This is a demo project to summarize my experience in the Salesforce platform.

## Covered topics

- Scratch orgs
    - Enable `Person Accounts` and `Communities` features.
- Data modeling, objects and validations
    - Junction objects with master-detail parent fields to represent many-to-many relatioships.
    - Lookup filters and validation rules to accomplish business logic declaratively.
- Apex
    - `Util` class with common and generic functions to reuse across the org.
    - Simple trigger framework to provide trigger functionality across the objects.
        - `TriggerHandler` -> `SObjectTriggerHandler` -> `SObjectHelper`
- Flow
    - Use Record-Triggered Flow instead of complex Apex Triggers to avoid coding when it's not necessary, in that case to perform actions before the record is updated and only when the record is changed to meet the conditions.
    