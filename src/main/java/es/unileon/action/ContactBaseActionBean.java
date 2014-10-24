/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/
package es.unileon.action;

import es.unileon.dao.ContactDao;
import es.unileon.dao.mock.MockContactDao;
import es.unileon.model.Contact;

public abstract class ContactBaseActionBean extends BaseActionBean {
    private Contact contact;

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    private ContactDao contactDao = MockContactDao.getInstance();

    protected ContactDao getContactDao() {
        return contactDao;
    }
}
