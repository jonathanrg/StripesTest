/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/
package es.unileon.action;

import java.util.List;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;
import es.unileon.model.Contact;

public class ContactListActionBean extends ContactBaseActionBean {
    private static final String LIST="/WEB-INF/jsp/contact_list.jsp";
    private static final String VIEW="/WEB-INF/jsp/contact_view.jsp";

    @DefaultHandler
    public Resolution list() {
        return new ForwardResolution(LIST);
    }

    public Resolution view() {
        return new ForwardResolution(VIEW);
    }

    public Resolution delete() {
        Contact deleted = getContact();
        getContactDao().delete(deleted.getId());
        getContext().getMessages().add(
            new SimpleMessage("Deleted {0}.", deleted)
        );
        return new RedirectResolution(getClass());
    }

    public List<Contact> getContacts() {
        return getContactDao().read();
    }
}
