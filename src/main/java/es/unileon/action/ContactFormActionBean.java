/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/
package es.unileon.action;

import java.util.Date;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.validation.EmailTypeConverter;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;
import net.sourceforge.stripes.validation.ValidationErrors;
import net.sourceforge.stripes.validation.ValidationMethod;
import es.unileon.model.Contact;
import es.unileon.model.Gender;

public class ContactFormActionBean extends ContactBaseActionBean {
    private static final String FORM="/WEB-INF/jsp/contact_form.jsp";

    @DefaultHandler
    public Resolution form() {
        return new ForwardResolution(FORM);
    }
    public Resolution save() {
        Contact contact = getContact();
        getContactDao().save(contact);
        getContext().getMessages().add(
            new SimpleMessage("{0} has been saved.", contact)
        );
        return new RedirectResolution(ContactListActionBean.class);
    }
    @DontValidate
    public Resolution cancel() {
        getContext().getMessages().add(
            new SimpleMessage("Action cancelled.")
        );
        return new RedirectResolution(ContactListActionBean.class);
    }

    @ValidateNestedProperties({
        @Validate(field="firstName", maxlength=25),
        @Validate(field="lastName",  minlength=2, maxlength=40),
        @Validate(field="email", required=true, on="save",
            converter=EmailTypeConverter.class),
        @Validate(field="birthDate", expression="${this < today}")
    })
    @Override
    public void setContact(Contact contact) {
        super.setContact(contact);
    }

    @ValidationMethod(on="save")
    public void validateEmailUnique(ValidationErrors errors) {
        String email = getContact().getEmail();
        Contact other = getContactDao().findByEmail(email);
        if (other != null && !other.equals(getContact())) {
            errors.add("contact.email", new SimpleError(
                "{1} is already used by {2}.", other));
        }
    }
    public Date getToday() {
        return new Date();
    }
    
    public Gender[] getGenders() {
        return Gender.values();
    }
    
}
