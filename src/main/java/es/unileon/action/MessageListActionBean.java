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
import net.sourceforge.stripes.validation.Validate;
import es.unileon.dao.FolderDao;
import es.unileon.dao.mock.MockFolderDao;
import es.unileon.model.Folder;
import es.unileon.model.Message;


public class MessageListActionBean extends BaseActionBean {
    private static final String LIST="/WEB-INF/jsp/message_list.jsp";

    @DefaultHandler
    public Resolution list() {
        return new ForwardResolution(LIST);
    }
    
    public Resolution delete() {
        for (Message message : selectedMessages) {
            folderDao.deleteMessage(message);
        }
        return new RedirectResolution(getClass());
    }
    
    public Resolution moveToFolder() {
        for (Message message : selectedMessages) {
            folderDao.addMessage(message, selectedFolder);
        }
        return new RedirectResolution(getClass());
    }
    
    @Validate(required=true, on={"delete", "moveToFolder"})
    
    private List<Message> selectedMessages;
    
    public List<Message> getSelectedMessages() {
        return selectedMessages;
    }
    public void setSelectedMessages(List<Message> selectedMessages) {
        this.selectedMessages = selectedMessages;
    }
    
    @Validate(required=true, on="moveToFolder")
    private Folder selectedFolder;
    public Folder getSelectedFolder() {
        return selectedFolder;
    }
    public void setSelectedFolder(Folder selectedFolder) {
        this.selectedFolder = selectedFolder;
    }
    
    private FolderDao folderDao = MockFolderDao.getInstance();
    
}

