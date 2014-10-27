<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%-- START:folders --%>
<jsp:useBean class="es.unileon.view.FoldersViewHelper" id="folders"/>
<!-- ... -->
<s:layout-definition>
  <!-- ... -->
<%-- END:folders --%>
  <s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp"
    title="${title}" currentSection="${currentSection}">
    <s:layout-component name="body">

<%-- START:folders --%>
      <div id="folders">
        <d:table name="${folders.folders}" id="folder">
          <d:column title="Name">
            <s:link
              beanclass="es.unileon.action.MessageListActionBean">
              <s:param name="folder" value="${folder.id}"/>
              ${folder.name}
            </s:link>
            <c:if test="${actionBean.context.currentFolder eq folder}">
              <img src="${contextPath}/images/arrow.png"
                style="border: none; vertical-align: bottom"/>
            </c:if>
          </d:column>
          <d:column title="Messages" style="text-align: right">
             ${fn:length(folder.messages)}
          </d:column>
        </d:table>
      </div>
      <!-- ... -->
<%-- END:folders --%>

      <div id="main">
        ${body}
      </div>

    </s:layout-component>
  </s:layout-render>
<%-- START:folders --%>
</s:layout-definition>
<%-- END:folders --%>
