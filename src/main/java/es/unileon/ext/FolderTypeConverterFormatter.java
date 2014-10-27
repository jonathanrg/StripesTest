/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/

package es.unileon.ext;


import java.util.Collection;
import java.util.Locale;

import net.sourceforge.stripes.format.Formatter;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.TypeConverter;
import net.sourceforge.stripes.validation.ValidationError;
import es.unileon.dao.FolderDao;
import es.unileon.dao.mock.MockFolderDao;
import es.unileon.model.Folder;


public class FolderTypeConverterFormatter
    implements TypeConverter<Folder>, Formatter<Folder>
{
    private FolderDao folderDao = MockFolderDao.getInstance();

    public Folder convert(String string,
        Class<? extends Folder> type,
        Collection<ValidationError> errors)
    {
        try {
            return folderDao.read(new Integer(string));
        }
        catch (Exception exc) {
            errors.add(new SimpleError(
                "The folder ID {1} is not valid."));
            return null;
        }
    }
    public String format(Folder folder) {
        if (folder != null) {
            return String.valueOf(folder.getId());
        }
        return "";
    }
    public void setLocale(Locale locale) { }
    public void setFormatType(String formatType) { }
    public void setFormatPattern(String formatType) { }
    public void init() { }
}

