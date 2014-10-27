<!--
 ! Excerpted from "Stripes: and Java Web Development is Fun Again",
 ! published by The Pragmatic Bookshelf.
 ! Copyrights apply to this code. It may not be used to create training material, 
 ! courses, books, articles, and the like. Contact us if you are in doubt.
 ! We make no guarantees that this code is fit for any purpose. 
 ! Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
-->
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
  title="Registration">
  <s:layout-component name="body">
  <%-- START:this --%>
    <p>Registration complete!</p>
    You may now
    <s:link beanclass="es.unileon.action.LoginActionBean">
      login
    </s:link>.
  <%-- END:this --%>
  </s:layout-component>
</s:layout-render>
