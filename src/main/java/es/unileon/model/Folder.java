/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/

package es.unileon.model;
public class Folder extends ModelBase {
    private String name;
    private int numberOfMessages;

    /* getters and setters... */

    public Folder() {
    }
    public Folder(String name, int numberOfMessages) {
        setName(name);
        setNumberOfMessages(numberOfMessages);
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getNumberOfMessages() {
        return numberOfMessages;
    }
    public void setNumberOfMessages(int numberOfMessages) {
        this.numberOfMessages = numberOfMessages;
    }

}

