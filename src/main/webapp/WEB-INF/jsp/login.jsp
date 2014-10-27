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
  title="Login">
  <s:layout-component name="body">
    <p>Please login:</p>
    <s:form beanclass="es.unileon.action.LoginActionBean">
      <s:errors/>
      <table class="form">
        <tr>
          <td><s:label for="username"/>:</td>
          <td><s:text name="username"/></td>
          <td>@unileon.es</td>
        </tr>
        <tr>
          <td><s:label for="password"/>:</td>
          <td><s:password name="password"/></td>
        </tr>
        <tr>
          <td></td>
          <td><s:submit name="login" value="Login"/></td>
        </tr>
      </table>
    </s:form>
    <s:link beanclass="es.unileon.action.RegisterActionBean">
      Register
    </s:link> to create an account.
  </s:layout-component>
</s:layout-render>
