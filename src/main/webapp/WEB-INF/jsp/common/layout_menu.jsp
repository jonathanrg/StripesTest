<!--
 ! Excerpted from "Stripes: and Java Web Development is Fun Again",
 ! published by The Pragmatic Bookshelf.
 ! Copyrights apply to this code. It may not be used to create training material, 
 ! courses, books, articles, and the like. Contact us if you are in doubt.
 ! We make no guarantees that this code is fit for any purpose. 
 ! Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
-->
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-definition>
  <s:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
    title="${title}">
    
    <s:layout-component name="menu">
    
      <s:url var="url" beanclass="es.unileon.action.MenuViewHelper"
        prependContext="false">
        <s:param name="currentSection" value="${currentSection}"/>
      </s:url>
      <jsp:include page="${url}"/>
      
    </s:layout-component>
    
    <s:layout-component name="body">${body}</s:layout-component>
  </s:layout-render>
</s:layout-definition>

