/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/

package es.unileon.ext;


import net.sourceforge.stripes.action.ActionBeanContext;
import es.unileon.dao.mock.MockFolderDao;
import es.unileon.model.Folder;
import es.unileon.model.Message;


public class MyActionBeanContext extends ActionBeanContext {
    private static final String FOLDER  = "folder";

    private static final String MESSAGE = "message";


    public void setCurrentFolder(Folder folder) {
        setCurrent(FOLDER, folder);
    }
    public Folder getCurrentFolder() {
        Folder folder = MockFolderDao.getInstance().read().get(0);
        return getCurrent(FOLDER, folder);
    }

    public void setMessageCompose(Message message) {
        setCurrent(MESSAGE, message);
    }
    public Message getMessageCompose() {
        return getCurrent(MESSAGE, new Message());
    }


    protected void setCurrent(String key, Object value) {
        getRequest().getSession().setAttribute(key, value);
    }
    @SuppressWarnings("unchecked")
    protected <T> T getCurrent(String key, T defaultValue) {
        T value = (T) getRequest().getSession().getAttribute(key);
        if (value == null) {
            value = defaultValue;
            setCurrent(key, value);
        }
        return value;
    }
}

