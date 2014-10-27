/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/
package es.unileon.dao.mock;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import es.unileon.dao.AttachmentDao;
import es.unileon.dao.FolderDao;
import es.unileon.model.Attachment;
import es.unileon.model.Folder;
import es.unileon.model.Message;

public class MockFolderDao extends MockDao<Folder>
    implements FolderDao
{
    private Folder inbox = new Folder("Inbox");
    private Folder sent  = new Folder("Sent");
    private Folder ref   = new Folder("Reference");
    private Folder trash = new Folder("Trash");

    private Folder[] FOLDERS = { inbox, sent, ref, trash };

    private int nextMessageId = 1;

    private static final int FROM    =  0;
    private static final int TO      =  1;
    private static final int SUBJECT =  2;
    private static final int TEXT    =  3;
    private static final int DATE    =  4;

    private static final String[] RAW_INBOX = {
        "Daniel Greene,freddy@es.unileon.org,Congratulations!,Message text goes here.,2008-04-23 19:55",
        "Habibi,habibti@es.unileon.org,I love you Habibti,Message text goes here.,2008-04-19 14:42",
        "Sammy Blair,freddy@es.unileon.org,Re: lunch,Message text goes here.,2008-04-18 20:42",
        "Accounts-dept,freddy@es.unileon.org,Important info,Message text goes here.,2008-04-17 04:49",
        "George Wells,freddy@es.unileon.org,Need help with a web site I'm trying to set up..,Message text goes here.,2008-04-16 19:00",
        "Jen Ballou,freddy@es.unileon.org,last month's results,Message text goes here.,2008-04-15 18:09",
        "autocalendar,lunch-group,lunch,Message text goes here.,2008-04-13 16:34",
        "Lou Thompson,freddy@es.unileon.org,Es-tu disponible demain?,Message text goes here.,2008-04-11 22:44",
        "Jason Wilson,freddy@es.unileon.org,Tennis,Message text goes here.,2008-04-11 22:42",
        "automailer,hockeypool-list,Go Habs Go!,Message text goes here.,2008-04-02 23:52",
        "Lou Thompson,freddy@es.unileon.org,Re: just a quick question,Message text goes here.,2008-04-01 00:00",
        "Amazon.ca,freddy@es.unileon.org,Your order has shipped!,Message text goes here.,2008-03-28 17:57",
        "Sourceforge Administrator,freddy@es.unileon.org,Your password has been reset,Message text goes here.,2008-03-21 08:59",
        "autolist,freddy@es.unileon.org,Welcome to Stripes-developers,Message text goes here.,2008-03-15 14:11",
        "autolist,freddy@es.unileon.org,Welcome to Stripes-users,Message text goes here.,2008-03-02 06:11",
        "RQAP,freddy@es.unileon.org,Votre dossier est complet,Message text goes here.,2008-02-27 07:27",
        "OIQ,freddy@es.unileon.org,Bulletin aux membres,Message text goes here.,2008-02-16 02:55",
        "Jen Ballou,freddy@es.unileon.org,next month's results,Message text goes here.,2008-02-15 03:03",
        "JIRA,stripes-development@stripesframework.org,Resolved: STS-542,Message text goes here.,2008-02-14 12:08",
        "JIRA,stripes-development@stripesframework.org,Commented: STS-542,Message text goes here.,2008-02-02 09:04",
        "Jason Wilson,freddy@es.unileon.org,This is not spam,Message text goes here.,2008-02-02 09:02",
        "JIRA,stripes-development@stripesframework.org,Created: STS-542,Message text goes here.,2008-01-30 14:32",
        "Sophie Hunter,freddy@es.unileon.org,Problem solved,Message text goes here.,2008-01-29 12:28",
        "Daddy,coucou@es.unileon.org,I love you Peekaboo,Message text goes here.,2008-01-27 07:27",
        "Jason Wilson,freddy@es.unileon.org,Happy Birthday,Message text goes here.,2008-01-24 04:42",
    };
    private static final DateFormat dateFormat =
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

    private MockFolderDao() {
        try {
            for (Folder folder : FOLDERS) {
                save(folder);
            }
            for (String string : RAW_INBOX) {
                addMessage(createMessageFromString(string), inbox);
            }
        }
        catch (Exception exc) {
            throw new RuntimeException(exc);
        }
    }
    private static MockFolderDao instance = new MockFolderDao();
    public static MockFolderDao getInstance() { return instance; }

    public Message readMessage(Integer messageId) {
        for (Folder folder : read()) {
            for (Message message : folder.getMessages()) {
                if (message.getId().equals(messageId)) {
                    return message;
                }
            }
        }
        return null;
    }
    public void addMessage(Message message, Folder folder) {
        if (message.getId() == null) {
            message.setId(nextMessageId++);
        }
        for (Folder next : read()) {
            if (next.equals(folder) && !next.getMessages().contains(message)) {
                next.getMessages().add(message);
            }
            if (!next.equals(folder) && next.getMessages().contains(message)) {
                next.getMessages().remove(message);
            }
        }
    }
    public void deleteMessage(Message message) {
        Folder source = null;
        for (Folder folder : read()) {
            if (folder.getMessages().contains(message)) {
                folder.getMessages().remove(message);
                source = folder;
                break;
            }
        }
        if (source.equals(trash)) {
            for (Attachment attachment : message.getAttachments()) {
                attachmentDao.delete(attachment.getId());
            }
        }
        else {
            addMessage(message, trash);
        }
    }
    private Message createMessageFromString(String string)
        throws Exception
    {
        String[] fields = string.split(",");

        Message message = new Message();

        message.setFrom(fields[FROM]);
        message.setTo(fields[TO]);
        message.setSubject(fields[SUBJECT]);
        message.setText(fields[TEXT]);
        message.setDate(dateFormat.parse(fields[DATE]));

        return message;
    }
    public void sendMessage(Message message) {
        addMessage(message, sent);
    }
    private AttachmentDao attachmentDao = MockAttachmentDao.getInstance();
}
