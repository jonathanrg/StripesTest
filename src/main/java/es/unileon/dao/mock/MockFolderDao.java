/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/
package es.unileon.dao.mock;

import es.unileon.dao.FolderDao;
import es.unileon.model.Folder;

public class MockFolderDao extends MockDao<Folder>
    implements FolderDao
{
    private Folder inbox = new Folder("Inbox", 24);
    private Folder sent  = new Folder("Sent", 12);
    private Folder trash = new Folder("Trash", 4);

    private Folder[] FOLDERS = { inbox, sent, trash };

    private MockFolderDao() {
        try {
            for (Folder folder : FOLDERS) {
                save(folder);
            }
        }
        catch (Exception exc) {
            throw new RuntimeException(exc);
        }
    }
    private static MockFolderDao instance = new MockFolderDao();
    public static MockFolderDao getInstance() { return instance; }
}
