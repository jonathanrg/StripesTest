<!--
 ! Excerpted from "Stripes: and Java Web Development is Fun Again",
 ! published by The Pragmatic Bookshelf.
 ! Copyrights apply to this code. It may not be used to create training material, 
 ! courses, books, articles, and the like. Contact us if you are in doubt.
 ! We make no guarantees that this code is fit for any purpose. 
 ! Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
-->
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<jsp:useBean class="es.unileon.view.FoldersViewHelper" id="folders"/>

<s:layout-definition>
  <s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp"
    title="${title}" currentSection="${currentSection}">
    <s:layout-component name="body">
      
      <div id="folders">
       
        <d:table name="${folders.folders}">
          <d:column property="name"/>
          <d:column property="numberOfMessages" title="Messages"/>
        </d:table>
      
      </div>
      
      <div id="main">
        ${body}
      </div>
    </s:layout-component>
  </s:layout-render>
</s:layout-definition>

