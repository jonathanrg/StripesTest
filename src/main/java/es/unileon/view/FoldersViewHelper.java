/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/

package es.unileon.view;


import java.util.List;

import es.unileon.model.Folder;
import es.unileon.dao.FolderDao;
import es.unileon.dao.mock.MockFolderDao;


public class FoldersViewHelper {
    private FolderDao folderDao = MockFolderDao.getInstance();

    public List<Folder> getFolders() {
        return folderDao.read();
    }
}

