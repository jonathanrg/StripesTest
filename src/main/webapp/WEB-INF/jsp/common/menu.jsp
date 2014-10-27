<!--
 ! Excerpted from "Stripes: and Java Web Development is Fun Again",
 ! published by The Pragmatic Bookshelf.
 ! Copyrights apply to this code. It may not be used to create training material, 
 ! courses, books, articles, and the like. Contact us if you are in doubt.
 ! We make no guarantees that this code is fit for any purpose. 
 ! Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
-->
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<c:forEach var="section" items="${actionBean.sections}">
  <c:choose>
    <c:when test="${section eq actionBean.currentSection}">
      <span class="currentSection">${section.text}</span>
    </c:when>
    <c:otherwise>
      <s:link beanclass="${section.beanclass}" class="sectionLink">
        ${section.text}
      </s:link>
    </c:otherwise>
  </c:choose>
</c:forEach>
