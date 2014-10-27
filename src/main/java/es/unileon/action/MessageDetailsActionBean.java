/***
 * Excerpted from "Stripes: and Java Web Development is Fun Again",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
***/
package es.unileon.action;

import java.io.FileInputStream;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.StreamingResolution;
import es.unileon.dao.AttachmentDao;
import es.unileon.dao.mock.MockAttachmentDao;
import es.unileon.model.Attachment;
import es.unileon.model.Message;

public class MessageDetailsActionBean extends BaseActionBean {
    private static String VIEW = "/WEB-INF/jsp/message_details.jsp";

    private Message message;
    public Message getMessage() {
        return message;
    }
    public void setMessage(Message message) {
        this.message = message;
    }

    @DefaultHandler
    public Resolution view() {
        return new ForwardResolution(VIEW);
    }


    public Integer attachmentId;

    public Resolution downloadAttachment() throws Exception {
        Attachment attachment = attachmentDao.read(attachmentId);
        String fileName = attachment.getFileName();
        String filePath = attachmentDao.getFilePath(attachment);
        return new StreamingResolution(attachment.getContentType(),
            new FileInputStream(filePath)).setFilename(fileName);
    }
    private AttachmentDao attachmentDao =
        MockAttachmentDao.getInstance();

}
