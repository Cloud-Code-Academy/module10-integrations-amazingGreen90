public class ContactTriggerHandler {

    public static void handleBeforeInsert(List<Contact> newContacts) {
        for (Contact contact : newContacts) {
            if (contact.DummyJSON_Id__c == null) {
                contact.DummyJSON_Id__c = String.valueOf((Integer) Math.floor(Math.random() * 101));
            }
        }
    }

    public static void handleAfterUpdate(List<Contact> updatedContacts) {
        for (Contact contact : updatedContacts) {
            if (contact.DummyJSON_Id__c != null && Integer.valueOf(contact.DummyJSON_Id__c) > 100) {
                DummyJSONCallout.postCreateDummyJSONUser(contact.Id);
            }
        }
    }
}
