/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/

package es.unileon.model;


import java.util.ArrayList;
import java.util.List;


public class Folder extends ModelBase {
    private String name;
    private List<Message> messages = new ArrayList<Message>();

    public Folder() {
    }
    public Folder(String name) {
        setName(name);
    }
    /* getters and setters... */


    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public List<Message> getMessages() {
        return messages;
    }
    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    @Override
    public String toString() {
        return name;
    }
}

