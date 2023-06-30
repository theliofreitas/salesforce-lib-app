# Salesforce Library App

> A Salesforce org designed for library management. ☁

## About

This is a demo project to summarize my experience in the Salesforce platform.

## Covered topics

- Scratch orgs
    - Enable `Person Accounts` and `Communities` features.
- Data modeling, objects and validations
    - Junction objects with master-detail parent fields to represent many-to-many relationships.
    - Lookup filters and validation rules to accomplish business logic declaratively.
- Apex
    - `Util` class with common and generic functions to reuse across the org.
    - Simple trigger framework to provide trigger functionality across the objects.
        - `TriggerHandler` -> `SObjectTriggerHandler` -> `SObjectHelper`
    - *Strategy design pattern* to implement different API services.
    - Use of Named Credentials to store API keys securely.
    - Parsing results of API requests with `JSON.deserializeUntyped()`.
- LWC
    - Use of `@AuraEnabled` annotation in the `BookData` custom type so it can be read by LWC components properly.
- Flow
    - Use Record-Triggered Flow instead of complex Apex Triggers to avoid coding when it's not necessary. In that case, to perform actions before the record is updated and only when the record is changed to meet the conditions.
    