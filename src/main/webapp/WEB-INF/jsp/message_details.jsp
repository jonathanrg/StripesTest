<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_folders.jsp"
  title="Message Details" currentSection="MessageList">
  <s:layout-component name="body">
    <table id="details">
      <tr>
        <th>From:</th>
        <td>${actionBean.message.from}</td>
      </tr>
      <tr>
        <th>To:</th>
        <td>${actionBean.message.to}</td>
      </tr>
      <tr>
        <th>Cc:</th>
        <td>${actionBean.message.cc}</td>
      </tr>
      <tr>
        <th>Bcc:</th>
        <td>${actionBean.message.bcc}</td>
      </tr>
      <tr>
        <th>Date:</th>
        <td>
          <s:format value="${actionBean.message.date}"
            formatType="datetime" formatPattern="medium"/>
        </td>
      </tr>
      <tr>
        <th>Subject:</th>
        <td>${actionBean.message.subject}</td>
      </tr>
      <tr>
        <td colspan="2">
          ${actionBean.message.text}
        </td>
      </tr>
    </table>
    <%-- START:streaming --%>
    <c:if test="${not empty actionBean.message.attachments}">
      <div>Attachments:</div>
      <div>
        <c:forEach var="attachment"
          items="${actionBean.message.attachments}">
          <s:link event="downloadAttachment"
            beanclass="es.unileon.action.MessageDetailsActionBean">
            <s:param name="attachmentId" value="${attachment.id}"/>
            ${attachment.fileName}
          </s:link>
         (${attachment.size} bytes)
          <br/>
        </c:forEach>
      </div>
    </c:if>
    <%-- END:streaming --%>
    <%-- START:include --%>
    <s:form beanclass="es.unileon.action.MessageListActionBean">
      <%@include file="/WEB-INF/jsp/common/message_action.jsp"%>
      <div>
        <s:hidden name="selectedMessages"
          value="${actionBean.message.id}"/>
      </div>
    </s:form>
    <%-- END:include --%>
    <p>
      <s:link beanclass="es.unileon.action.MessageListActionBean">
        Back to message list
      </s:link>
    </p>
  </s:layout-component>
</s:layout-render>
