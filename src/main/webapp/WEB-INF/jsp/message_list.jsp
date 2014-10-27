<!--
 ! Excerpted from "Stripes: and Java Web Development is Fun Again",
 ! published by The Pragmatic Bookshelf.
 ! Copyrights apply to this code. It may not be used to create training material, 
 ! courses, books, articles, and the like. Contact us if you are in doubt.
 ! We make no guarantees that this code is fit for any purpose. 
 ! Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
-->
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%-- START:messages --%>
<c:set var="folder" value="${actionBean.context.currentFolder}"/>
<s:layout-render name="/WEB-INF/jsp/common/layout_folders.jsp"
  title="Message List" currentSection="MessageList">
  <s:layout-component name="body">
<%-- END:messages --%>
<%--
START:messages
      <d:table name="${folder.messages}" requestURI="" id="message"
        pagesize="10" defaultsort="2" defaultorder="descending">
END:messages
--%>
  <%-- START:checkbox --%>
  <%-- START:include --%>
    <s:form beanclass="es.unileon.action.MessageListActionBean">
  <%-- END:checkbox --%>
  <%-- END:include --%>
  <%--
  START:include
      <d:table ...>
        <!-- ... -->
        <d:column>
          <s:checkbox name="selectedMessages" value="${message.id}"/>
        </d:column>
        <!-- ... -->
      </d:table>
  END:include
  --%>
  <%-- START:checkbox --%>
      <d:table name="${folder.messages}" requestURI="" id="message"
        pagesize="10" defaultsort="2" defaultorder="descending">
  <%-- END:checkbox --%>
  <%--
  START:pagination
      <d:table name="${folder.messages}" requestURI="" id="message"
        pagesize="10" defaultsort="2" defaultorder="descending">
        <!-- ... -->
  END:pagination
  --%>
  <%-- START:checkbox --%>
        <d:column>
          <s:checkbox name="selectedMessages" value="${message.id}"/>
        </d:column>
        <!-- ... -->
  <%-- END:checkbox --%>
  <%-- START:messages --%>
        <d:column title="Date" sortable="true">
          <s:format value="${message.date}"
            formatPattern="yyyy-MM-dd HH:mm"/>
        </d:column>
        <d:column property="from" sortable="true"/>
        <d:column property="to" sortable="true"/>
        <d:column title="Subject" sortable="true">
          <s:link
            beanclass="es.unileon.action.MessageDetailsActionBean">
            <s:param name="message" value="${message.id}"/>
            ${message.subject}
          </s:link>
        </d:column>
  <%-- START:checkbox --%>
  <%-- START:pagination --%>
      </d:table>
  <%-- END:pagination --%>
  <%-- END:checkbox --%>
  <%-- END:messages --%>
  <%-- START:include --%>
      <c:if test="${not empty folder.messages}">
      <%-- START:selectedMessagesRequired --%>
        <div><s:errors field="selectedMessages"/></div>
      <%-- END:selectedMessagesRequired --%>
        <%@include file="/WEB-INF/jsp/common/message_action.jsp"%>
      </c:if>
  <%-- START:checkbox --%>
    </s:form>
  <%-- END:include --%>
  <%-- END:checkbox --%>
<%-- START:messages --%>
  </s:layout-component>
</s:layout-render>
<%-- END:messages --%>
