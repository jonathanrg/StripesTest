<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp"
  title="Message Compose" currentSection="Compose">
  <%-- START:select --%>
  <jsp:useBean class="es.unileon.action.ContactListActionBean"
    id="contacts"/>
    <!-- ... -->
  <%-- END:select --%>
  <s:layout-component name="body">
  <%-- START:select --%>
    <s:form beanclass="es.unileon.action.MessageComposeActionBean">
      <!-- ... -->
  <%-- END:select --%>
      <s:errors field="message.to"/>
      <s:errors field="message.subject"/>
      <div>
        <table id="compose">
          <%-- START:imageButton --%>
          <c:set var="arrow" value="/images/arrow.png"/>
          <tr>
            <th>To:</th>
            <td><s:text name="message.to" size="60"/></td>
            <td><s:image name="addTo" src="${arrow}"/></td>
          <%-- END:imageButton --%>
            <td rowspan="4">
              <%-- START:select --%>
              <s:select name="contacts" multiple="true" size="7">
                <s:options-collection collection="${contacts.contacts}"
                  value="id" sort="firstName"/>
              </s:select>
              <%-- END:select --%>
            </td>
          <%-- START:imageButton --%>
          </tr>
          <tr>
            <th>Cc:</th>
            <td><s:text name="message.cc" size="60"/></td>
            <td><s:image name="addCc" src="${arrow}"/></td>
          </tr>
          <tr>
            <th>Bcc:</th>
            <td><s:text name="message.bcc" size="60"/></td>
            <td><s:image name="addBcc" src="${arrow}"/></td>
          </tr>
          <%-- END:imageButton --%>
          <tr>
            <th>Subject:</th>
            <td colspan="2">
              <s:text name="message.subject" size="60"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">
            <%-- START:textarea --%>
              <s:textarea name="message.text" cols="87" rows="12"/>
            <%-- END:textarea --%>
            </td>
          </tr>
        </table>
      </div>
      <%-- START:sfiletag --%>
      <div>Attachments:</div>
      <div><s:errors field="attachments"/></div>
      <div class="left">
        <%-- START:fileUpload --%>
        <c:forEach var="index" begin="0" end="3">
        <%-- END:fileUpload --%>
        <%-- START:fileUpload --%>
          <div><s:file name="attachments[${index}]"/></div>
        <%-- END:fileUpload --%>
        <%-- START:fileUpload --%>
        </c:forEach>
        <%-- END:fileUpload --%>
      </div>
      <div class="left">
        <s:submit name="upload" value="Upload"/>
      </div>
      <%-- END:sfiletag --%>
      <div class="left">
      <%-- START:deleteAttachment --%>
        <s:hidden id="deleteIndex" name="deleteIndex"/>
        <c:forEach items="${actionBean.message.attachments}"
          var="attach" varStatus="loop">
          <s:image name="deleteAttachment" src="/images/delete.gif"
            onclick="getElementById('deleteIndex').value=${loop.index}"
            style="border: none; vertical-align: bottom"/>
          ${attach.fileName} (${attach.size} bytes)
          <br/>
        </c:forEach>
      <%-- END:deleteAttachment --%>
      </div>
      <div class="clear"></div>
      <div id="buttons">
        <s:submit name="send" value="Send"/>
        <s:submit name="cancel" value="Cancel"/>
      </div>
  <%-- START:select --%>
      <!-- ... -->
    </s:form>
  </s:layout-component>
  <%-- END:select --%>
</s:layout-render>
